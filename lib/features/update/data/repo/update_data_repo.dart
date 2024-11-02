import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class UpdateDataRepo {
  Future<Either<Failure, void>> updateUserData(String key, var value);
  Future<Either<Failure, void>> updateProductData(String productID, String key, var value);
}
