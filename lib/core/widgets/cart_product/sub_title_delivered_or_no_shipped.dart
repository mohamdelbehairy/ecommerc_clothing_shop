import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/order/presentation/manager/order/order_cubit.dart';
import '../../../features/product/presentation/widgets/custom_add_or_minus_widget.dart';

class SubTitleDeliveredOrNoshipped extends StatelessWidget {
  const SubTitleDeliveredOrNoshipped({super.key, required this.orderID});
  final String orderID;

  @override
  Widget build(BuildContext context) {
    var updateOrder = context.read<OrderCubit>();
    return Row(
      children: [
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.done,
            onTap: () async {
              GoRouter.of(context).pop();
              await updateOrder.updateOrder(
                  orderID: orderID, value: Constants.orderDelivered);
            }),
        const SizedBox(width: 12),
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.close,
            onTap: () async {
              GoRouter.of(context).pop();
              await updateOrder.updateOrder(
                  orderID: orderID, value: Constants.orderNotDelivered);
            }),
      ],
    );
  }
}
