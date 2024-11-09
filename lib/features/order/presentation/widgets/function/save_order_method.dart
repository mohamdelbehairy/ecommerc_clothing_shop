import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../data/models/order_model.dart';
import '../../manager/order/order_cubit.dart';
import 'generate_order_id.dart';

Future<void> saveOrderMethod(BuildContext context) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  await context.read<OrderCubit>().saveOrder(
      orderModel: OrderModel(
          id: const Uuid().v4(),
          orderID: generateOrderID(),
          quantity: buildAppCubit.quantity.toString(),
          color: buildAppCubit.color,
          size: buildAppCubit.size,
          shippingAddress: buildAppCubit.shippingAddress.isNotEmpty
              ? buildAppCubit.shippingAddress
              : buildAppCubit.userData!.shippingAddress!,
          shippingCost: buildAppCubit.shippingCost.toString(),
          orderTime: DateTime.now(),
          productModel: buildAppCubit.productData!));
}
