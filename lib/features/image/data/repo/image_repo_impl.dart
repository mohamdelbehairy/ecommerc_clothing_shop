import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:image_picker/image_picker.dart';

import 'image_repo.dart';

class ImageRepoImpl extends ImageRepo {
  @override
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return Right(image);
      }
      return Left(Failure(message: "image is not selected"));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage() async{
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
