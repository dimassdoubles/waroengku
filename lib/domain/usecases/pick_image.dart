import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(BuildContext? context, {bool camera = false}) async {
  try {
    final XFile? file = await ImagePicker().pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    return File(file!.path);
  } catch (e) {
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(
            e.toString(),
          ),
        );
      },
    );
  }
  return null;
}
