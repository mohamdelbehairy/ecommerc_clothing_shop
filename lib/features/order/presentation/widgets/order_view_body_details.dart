import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/no_notification_and_orders_widget.dart';
import '../../data/models/order_model.dart';
import '../manager/build_order/build_order_cubit.dart';
import '../manager/order/order_cubit.dart';
import 'no_proccessing_or_shipping_or_deliverd_widget.dart';
import 'order_header_list_view.dart';
import 'order_list_view.dart';

class OrderViewBodyDetails extends StatelessWidget {
  const OrderViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var buildOrder = context.watch<BuildOrderCubit>();
    var order = context.read<OrderCubit>();

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        List<OrderModel> orders;
        if (buildOrder.orderActiveIndex == 0) {
          orders = order.processing;
        } else if (buildOrder.orderActiveIndex == 1) {
          orders = order.shipped;
        } else if (buildOrder.orderActiveIndex == 2) {
          orders = order.delivered;
        } else {
          orders = order.notDelivered;
        }
        if (order.processing.isNotEmpty ||
            order.shipped.isNotEmpty ||
            order.delivered.isNotEmpty ||
            order.notDelivered.isNotEmpty) {
          return Flexible(
            child: Column(
              children: [
                const OrderHeaderListView(),
                OrderListView(orders: orders),
                if (buildOrder.orderActiveIndex == 0 &&
                    order.processing.isEmpty)
                  const NoProccessingorShippedOrDeliverdWidget(
                      text: 'Processing'),
                if (buildOrder.orderActiveIndex == 1 && order.shipped.isEmpty)
                  const NoProccessingorShippedOrDeliverdWidget(text: 'Shipped'),
                if (buildOrder.orderActiveIndex == 2 && order.delivered.isEmpty)
                  const NoProccessingorShippedOrDeliverdWidget(
                      text: 'Delivered'),
                if (buildOrder.orderActiveIndex == 3 &&
                    order.notDelivered.isEmpty)
                  const NoProccessingorShippedOrDeliverdWidget(
                      text: 'Not Delivered'),
                if ((buildOrder.orderActiveIndex == 0 &&
                        order.processing.isEmpty) ||
                    (buildOrder.orderActiveIndex == 1 &&
                        order.shipped.isEmpty) ||
                    (buildOrder.orderActiveIndex == 2 &&
                        order.delivered.isEmpty) ||
                    (buildOrder.orderActiveIndex == 3 &&
                        order.notDelivered.isEmpty))
                  const Spacer(),
              ],
            ),
          );
        }

        return const NoNotificationAndOrdersWidget(
            text: 'No Orders yet', image: Assets.imagesNoOrders);
      },
    );
  }
}
