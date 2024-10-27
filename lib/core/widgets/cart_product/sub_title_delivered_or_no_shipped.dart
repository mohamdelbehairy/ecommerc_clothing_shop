import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/product/presentation/widgets/custom_add_or_minus_widget.dart';

class SubTitleDeliveredOrNoshipped extends StatelessWidget {
  const SubTitleDeliveredOrNoshipped({super.key, required this.orderID});
  final String orderID;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.done,
            onTap: () {
              GoRouter.of(context).pop();
              log('delivered: $orderID');
            }),
        const SizedBox(width: 12),
        CustomAddOrMinusWidget(
            size: 24,
            icon: Icons.close,
            onTap: () {
              GoRouter.of(context).pop();
            }),
      ],
    );
  }
}
