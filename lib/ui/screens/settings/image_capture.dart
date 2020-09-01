import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  PickedFile _imageFile;
  File _finalImageFile;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<PickedFile> _pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker.platform.pickImage(source: source);
    return selected;
  }

  Future<void> _cropImage() async {
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
        toolbarWidgetColor: Theme.of(context).primaryColor,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Crop Image',
      ),
    );
    if (croppedFile != null) {
      _finalImageFile = croppedFile;
    }
    return _finalImageFile;
  }
}
