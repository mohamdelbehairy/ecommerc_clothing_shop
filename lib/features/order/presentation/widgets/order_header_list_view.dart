import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_order/build_order_cubit.dart';
import 'order_header_item.dart';

class OrderHeaderListView extends StatelessWidget {
  const OrderHeaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildOrder = context.watch<BuildOrderCubit>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: List.generate(
            4,
            (index) => GestureDetector(
              onTap: () => buildOrder.orderChange(index),
              child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: OrderHeaderItem(
                    text: buildOrder.ordersHeader[index],
                    isActive: index == buildOrder.orderActiveIndex,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
