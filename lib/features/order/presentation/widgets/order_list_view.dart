import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'order_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: orders.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.only(bottom: 12), child: OrderItem());
          }),
    );
  }
}
