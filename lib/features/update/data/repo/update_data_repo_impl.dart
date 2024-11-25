import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/data/repo/update_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../../user_data/data/models/user_data_model.dart';

class UpdateDataRepoImpl extends UpdateDataRepo {
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

  @override
  Future<Either<Failure, void>> updateAllUserData(
      UserDataModel userData) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        Constants.userName: userData.userName,
        Constants.userImage: userData.userImage,
        Constants.type: userData.type,
        Constants.age: userData.age,
        Constants.dateTime: userData.dateTime
      });
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductData(
      String productID, String key, var value) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.productsCollection)
          .doc(productID)
          .update({key: value});

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNotification(String notifyID) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.notificationCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.notificationCollection)
          .doc(notifyID)
          .update({Constants.isSeen: true});

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(
      String orderID, String value) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.ordersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.ordersCollection)
          .doc(orderID)
          .update({'orderType': value});

      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
