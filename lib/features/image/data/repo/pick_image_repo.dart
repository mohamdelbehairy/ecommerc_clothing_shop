import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class PickImageRepo {
  Future<Either<Failure, XFile?>> pickImage();
}
