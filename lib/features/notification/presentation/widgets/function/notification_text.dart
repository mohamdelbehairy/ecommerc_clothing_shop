  import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/notification/data/models/notification_model.dart';

String notificationText(NotificationModel notifyModel) {
    String name = '';
    if (notifyModel.userName.isNotEmpty) {
      name = '${notifyModel.userName},';
    }

    String orderID = notifyModel.orderModel.orderID.toString();
    String result = '';

    switch (notifyModel.orderModel.orderType) {
      case Constants.orderProcessing:
        result =
            '$name you placed an order. Check your order history for full details.';
        break;
      case Constants.orderShipped:
        result =
            '$name your Order #$orderID has been confirmed. Check your order history for full details.';
        break;
      case Constants.orderDelivered:
        result =
            '$name Thank you for shopping with us. We have delivered order #$orderID.';
        break;
      case Constants.orderNotDelivered:
        result =
            '$name Thank you for shopping with us. We have canceled order #$orderID.';
        break;
      default:
        result = '';
        break;
    }

    return result;
  }