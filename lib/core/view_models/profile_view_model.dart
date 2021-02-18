import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hero_premier/core/models/individual_detail.dart';
import 'package:hero_premier/core/models/rank/rank_response.dart';
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

  IndividualDetail get individualResponse => _userService.individualDetail;

  RankResponse get individualRank => _userService.rankResponse;

  get updatedImageUrl => _userService.imageUrl;

  get user =>
      _userService.loginModel.result.local ??
      _userService.loginModel.result.facebook;

  updateProfile(String name, String dob, String gender, String address,
      String contact) async {
    try {
      setLoading();
      await _userService.updateProfile({
        "userId": _userService.userId,
        "name": name,
        "address": address,
        "dob": dob,
        "phoneNumber": contact
      });
      Fluttertoast.showToast(
          msg: "Updated successfully.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0);
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  fetchUserDetails() async {
    try {
      setLoading();
      String _userId = _winnerService.selectedWinnerId;
      await _userService.fetchUserDetails(_userId);
      await _userService.fetchUserRank(_userId);
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  pickImage(ImageSource source) async {
    // ignore: invalid_use_of_visible_for_testing_member
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
        await _userService
            .uploadProfileImage({"userId": _userService.userId, "image": file});
        Fluttertoast.showToast(
            msg: "Image update successful.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.withOpacity(0.9),
            textColor: Colors.white,
            fontSize: 16.0);
        setCompleted();
      } catch (e) {
        setError(e);
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
