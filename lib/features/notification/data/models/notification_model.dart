import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../order/data/models/order_model.dart';

class NotificationModel {
  final String notifyID, userName;
  final bool isSeen;
  final DateTime notifyDate;
  final OrderModel orderModel;

  NotificationModel(
      {required this.notifyID,
      required this.userName,
      this.isSeen = false,
      required this.notifyDate,
      required this.orderModel});

  factory NotificationModel.fromJson(json) {
    return NotificationModel(
        notifyID: json['notifyID'],
        userName: json['userName'],
        isSeen: json['isSeen'],
        notifyDate: (json['notifyDate'] as Timestamp).toDate(),
        orderModel: OrderModel.fromJson(json['orderModel']));
  }

  toJson() {
    return {
      'notifyID': notifyID,
      'userName': userName,
      'isSeen': isSeen,
      'notifyDate': notifyDate,
      'orderModel': orderModel.toJson()
    };
  }
}
