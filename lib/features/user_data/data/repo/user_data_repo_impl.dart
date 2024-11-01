import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_data_model.dart';
import 'user_data_repo.dart';

class UserDataRepoImpl extends UserDataRepo {
  @override
  Future<Either<Failure, void>> saveUserData(
      UserDataModel userDataModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
          .doc(userDataModel.userId)
          .set(userDataModel.toJson());

      return const Right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(Failure(message: e.code));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  void getUserData(
      Function(QuerySnapshot<Map<String, dynamic>>)? onData) async {
    FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .snapshots()
        .listen(onData);
  }

  @override
  Future<Either<Failure, void>> updateUserData(String key, var value) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({key: value});
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
