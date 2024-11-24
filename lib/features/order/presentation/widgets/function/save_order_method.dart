import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../notification/data/models/notification_model.dart';
import '../../../data/models/order_model.dart';
import '../../manager/order/order_cubit.dart';
import 'generate_order_id.dart';

Future<void> saveOrderMethod(BuildContext context) async {
  var buildApp = context.read<BuildAppCubit>();
  var saveOrder = context.read<OrderCubit>();

  final id = const Uuid().v4();
  final dateTime = DateTime.now();
  var orderModel = OrderModel(
      id: id,
      orderID: generateOrderID(),
      quantity: buildApp.quantity.toString(),
      color: buildApp.color,
      size: buildApp.size,
      shippingAddress: buildApp.shippingAddress.isNotEmpty
          ? buildApp.shippingAddress
          : buildApp.userData!.shippingAddress!,
      shippingCost: buildApp.shippingCost.toString(),
      orderTime: dateTime,
      productModel: buildApp.productData!);

  await buildApp.storeNotification(
      notifyModel: NotificationModel(
          notifyID: id,
          notifyDate: dateTime,
          userName: FirebaseAuth.instance.currentUser!.displayName != null
              ? FirebaseAuth.instance.currentUser!.displayName!.split(" ")[0]
              : '',
          orderModel: orderModel));
  await saveOrder.saveOrder(orderModel: orderModel);
}
