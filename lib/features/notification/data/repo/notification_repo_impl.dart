import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/notification_model.dart';
import 'notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failure, void>> storeNotification(
      NotificationModel notifyModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.notificationCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constants.notificationCollection)
          .doc(notifyModel.notifyID)
          .set(notifyModel.toJson());

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
