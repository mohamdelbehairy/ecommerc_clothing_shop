import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';

import '../models/user_data_model.dart';

abstract class UserDataRepo {
  Future<Either<Failure, void>> saveUserData(UserDataModel userDataModel);
  void getUserData(Function(QuerySnapshot<Map<String, dynamic>>)? onData);
}
