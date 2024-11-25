import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../features/notification/data/models/notification_model.dart';
import '../../../../features/order/data/models/order_model.dart';
import '../../../../features/update/presentation/manager/update_data/update_data_cubit.dart';

Future<void> orderNotDeliverdOnTap(BuildContext context,
    {required OrderModel orderData}) async {
  var updateOrder = context.read<UpdateDataCubit>();
  var notify = context.read<BuildAppCubit>();

  await updateOrder.updateOrder(
      orderID: orderData.id!, value: Constants.orderNotDelivered);

  await notify.storeNotification(
      notifyModel: NotificationModel(
          notifyID: const Uuid().v4(),
          userName: FirebaseAuth.instance.currentUser!.displayName != null
              ? FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]
              : '',
          notifyDate: DateTime.now(),
          orderModel:
              orderData.copyWith(orderType: Constants.orderNotDelivered)));
}
