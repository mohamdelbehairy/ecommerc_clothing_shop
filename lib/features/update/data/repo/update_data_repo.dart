import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';

import '../../../../core/error/failure.dart';

abstract class UpdateDataRepo {
  Future<Either<Failure, void>> updateUserData(String key, var value);
  Future<Either<Failure, void>> updateAllUserData(UserDataModel userData);

  Future<Either<Failure, void>> updateProductData(
      String productID, String key, var value);

  Future<Either<Failure, void>> updateNotification(String notifyID);

  Future<Either<Failure, void>> updateOrder(String orderID, String value);
}
