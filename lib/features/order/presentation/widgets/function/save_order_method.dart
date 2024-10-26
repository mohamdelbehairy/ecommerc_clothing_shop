import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../data/models/order_model.dart';
import '../../manager/order/order_cubit.dart';
import 'generate_order_id.dart';

Future<void> saveOrderMethod(BuildContext context) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  await context.read<OrderCubit>().saveOrder(
      orderModel: OrderModel(
          orderID: generateOrderID(),
          quantity: buildAppCubit.quantity.toString(),
          color: buildAppCubit.color,
          size: buildAppCubit.size,
          shippingAddress: buildAppCubit.shippingAddress,
          orderTime: DateTime.now(),
          productModel: buildAppCubit.productData!));
}