import 'package:e_clot_shop/features/notification/data/models/notification_model.dart';
import 'package:e_clot_shop/features/notification/presentation/manager/notification/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../data/models/order_model.dart';
import '../../manager/order/order_cubit.dart';
import 'generate_order_id.dart';

Future<void> saveOrderMethod(BuildContext context) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  var notifiy = context.read<NotificationCubit>();
  var saveOrder = context.read<OrderCubit>();

  String id = const Uuid().v4();
  var orderModel = OrderModel(
      id: id,
      orderID: generateOrderID(),
      quantity: buildAppCubit.quantity.toString(),
      color: buildAppCubit.color,
      size: buildAppCubit.size,
      shippingAddress: buildAppCubit.shippingAddress.isNotEmpty
          ? buildAppCubit.shippingAddress
          : buildAppCubit.userData!.shippingAddress!,
      shippingCost: buildAppCubit.shippingCost.toString(),
      orderTime: DateTime.now(),
      productModel: buildAppCubit.productData!);

  await notifiy.storeNotification(
      notifyModel: NotificationModel(
          notifyID: id, userName: "user", orderModel: orderModel));
  await saveOrder.saveOrder(orderModel: orderModel);
}
