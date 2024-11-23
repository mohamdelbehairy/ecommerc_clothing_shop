import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../features/notification/data/models/notification_model.dart';
import '../../../../features/notification/presentation/manager/notification/notification_cubit.dart';
import '../../../../features/order/data/models/order_model.dart';
import '../../../../features/order/presentation/manager/order/order_cubit.dart';

Future<void> orderDeliverdOnTap(BuildContext context,
    {required OrderModel orderData}) async {
  var updateOrder = context.read<OrderCubit>();
  var notify = context.read<NotificationCubit>();
  await updateOrder.updateOrder(
      orderID: orderData.id!, value: Constants.orderDelivered);
  await notify.storeNotification(
      notifyModel: NotificationModel(
          notifyID: const Uuid().v4(),
          userName: FirebaseAuth.instance.currentUser!.displayName != null
              ? FirebaseAuth.instance.currentUser!.displayName!
              : '',
          notifyDate: DateTime.now(),
          orderModel: orderData.copyWith(orderType: Constants.orderDelivered)));
}
