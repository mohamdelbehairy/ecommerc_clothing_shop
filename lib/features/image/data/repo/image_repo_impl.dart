import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'image_repo.dart';

class ImageRepoImpl extends ImageRepo {
  @override
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      var image = await ImagePicker().pickImage(
          imageQuality: 50,
          requestFullMetadata: false,
          maxHeight: 1920,
          maxWidth: 1080,
          source: ImageSource.gallery);
      if (image != null) {
        return Right(image);
      }
      return Left(Failure(message: "image is not selected"));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      var refrence = FirebaseStorage.instance.ref().child("images/$fileName");
      await refrence.putFile(imageFile);
      var imageUrl = await refrence.getDownloadURL();

      return Right(imageUrl);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
