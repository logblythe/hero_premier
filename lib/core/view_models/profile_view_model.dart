import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends BaseViewModel {
  NavigationService _navigationService;
  UserService _userService;
  WinnerService _winnerService;

  PickedFile _imageFile;
  File _finalImageFile;

  ProfileViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
    @required WinnerService winnerService,
  })  : this._navigationService = navigationService,
        this._userService = userService,
        this._winnerService = winnerService;

  Future<User> getUserModel() async {
    return _userService.getUserModel();
  }

  User get user => _userService.user;


  updateProfile(String name, String dob, String gender, String address,
      String contact) async {
    try {
      setLoading();
      var response = await _userService.updateProfile({
        "userId": await _userService.getUserId(),
        "name": name,
        "address": address,
        "dob": dob,
        "phoneNumber": contact
      });
      setDialogContent(response);
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  fetchUserDetails() async {
    try {
      setLoading();
      String _userId =
          _winnerService.selectedWinnerId ?? await _userService.getUserId();
      await _userService.fetchUserDetails(_userId);
      await _userService.fetchUserRank(_userId);
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker.platform.pickImage(source: source);
    if (selected != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _imageFile = selected;
        print('path ${_imageFile.path}');
        cropImage();
      });
    }
  }

  uploadImage(File file) async {
    if (file != null) {
      try {
        setLoading();
        String _userId = await _userService.getUserId();
        await _userService.uploadProfileImage({
          "userId": _userId,
          "image": file
        });
        setCompleted();
      } catch (e) {
        setError(e.toString());
      }
    } else {
      setError('error');
    }
  }

  cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Crop Image',
      ),
    );
    if (croppedFile != null) {
      _finalImageFile = croppedFile ?? _imageFile;
      Future.delayed(const Duration(milliseconds: 300), () {
        uploadImage(_finalImageFile);
      });
    }
  }

  navigateSetting() => _navigationService.replace(RoutePaths.SETTING);

  @override
  void dispose() {
    _winnerService.setSelectedWinnerId(null);
    super.dispose();
  }
}
