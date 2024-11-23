import '../../../order/data/models/order_model.dart';

class NotificationModel {
  final String notifyID, userName;
  final bool isSeen;
  final OrderModel orderModel;

  NotificationModel(
      {required this.notifyID,
      required this.userName,
      this.isSeen = false,
      required this.orderModel});

  factory NotificationModel.fromJson(json) {
    return NotificationModel(
        notifyID: json['notifyID'],
        userName: json['userName'],
        isSeen: json['isSeen'],
        orderModel: OrderModel.fromJson(json['orderModel']));
  }

  toJson() {
    return {
      'notifyID': notifyID,
      'userName': userName,
      'isSeen': isSeen,
      'orderModel': orderModel.toJson()
    };
  }
}
