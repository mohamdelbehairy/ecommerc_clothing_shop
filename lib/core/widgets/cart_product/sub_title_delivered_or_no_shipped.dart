import 'package:e_clot_shop/core/widgets/cart_product/function/order_not_deliverd_ontap.dart';
import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/product/presentation/widgets/custom_add_or_minus_widget.dart';
import 'function/order_deliverd_ontap.dart';

class SubTitleDeliveredOrNoshipped extends StatelessWidget {
  const SubTitleDeliveredOrNoshipped({super.key, required this.orderData});
  final OrderModel orderData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.done,
            onTap: () async {
              GoRouter.of(context).pop();
              await orderDeliverdOnTap(context, orderData: orderData);
            }),
        const SizedBox(width: 12),
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.close,
            onTap: () async {
              GoRouter.of(context).pop();
              await orderNotDeliverdOnTap(context, orderData: orderData);
            }),
      ],
    );
  }
}
