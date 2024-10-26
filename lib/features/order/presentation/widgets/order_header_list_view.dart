import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_order/build_order_cubit.dart';
import 'order_header_item.dart';

class OrderHeaderListView extends StatelessWidget {
  const OrderHeaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildOrder = context.watch<BuildOrderCubit>();
    return Row(
      children: List.generate(
        3,
        (index) => GestureDetector(
          onTap: () => buildOrder.orderChange(index),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: index == 1 ? 12 : 0.0),
              child: OrderHeaderItem(
                text: buildOrder.ordersHeader[index],
                isActive: index == buildOrder.orderActiveIndex,
              )),
        ),
      ),
    );
  }
}
