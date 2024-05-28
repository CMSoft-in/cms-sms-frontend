import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  final ImagePicker _picker = ImagePicker();

  void showPicker(BuildContext context, Function(File) onImagePicked) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pick an Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Pick from Gallery"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a Photo"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
