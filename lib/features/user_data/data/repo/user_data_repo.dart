import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';

abstract class UserDataRepo {
  Future<Either<Failure, void>> saveUserData(UserDataModel userDataModel);
}
