import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';

import '../models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, void>> storeNotification(
      NotificationModel notifyModel);
  void getNotification(
      void Function(QuerySnapshot<Map<String, dynamic>>)? onData);
}
