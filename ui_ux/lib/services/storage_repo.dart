import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepo extends GetxController {
  static StorageRepo get instance => Get.find();
  final cloudinary = Cloudinary.signedConfig(
    apiKey: "519318338932629",
    apiSecret: '7LK4y_FtsjflFUeT6l1IGgaU35k',
    cloudName: "dmlf8agon",
  );

  Future<String> uploadFile(XFile file, String filename) async {
    File pictureFile = File(file.path);

    final response = await cloudinary.upload(
      file: pictureFile.path,
      fileBytes: pictureFile.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
      folder: "images",
      fileName: filename,
    );

    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
    }
    return response.secureUrl.toString();
  }
}