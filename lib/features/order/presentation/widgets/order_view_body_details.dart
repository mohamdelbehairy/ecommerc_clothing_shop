import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/no_notification_and_orders_widget.dart';
import '../../../../core/widgets/notification_and_order_state_loading_widget.dart';
import '../../data/models/order_model.dart';
import '../manager/build_order/build_order_cubit.dart';
import 'no_proccessing_or_shipping_or_deliverd_widget.dart';
import 'order_header_list_view.dart';
import 'order_list_view.dart';

class OrderViewBodyDetails extends StatelessWidget {
  const OrderViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var buildOrder = context.read<BuildOrderCubit>();

    return BlocBuilder<BuildOrderCubit, BuildOrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const NotificationAndOrderStateLoadingWidget();
        }
        List<OrderModel> orders;
        if (buildOrder.orderActiveIndex == 0) {
          orders = buildOrder.processing;
        } else if (buildOrder.orderActiveIndex == 1) {
          orders = buildOrder.shipped;
        } else if (buildOrder.orderActiveIndex == 2) {
          orders = buildOrder.delivered;
        } else {
          orders = buildOrder.notDelivered;
        }
        if (buildOrder.processing.isNotEmpty ||
            buildOrder.shipped.isNotEmpty ||
            buildOrder.delivered.isNotEmpty ||
            buildOrder.notDelivered.isNotEmpty) {
          return Column(
            children: [
              const OrderHeaderListView(),
              OrderListView(orders: orders),
              if (buildOrder.orderActiveIndex == 0 &&
                  buildOrder.processing.isEmpty)
                const NoProccessingorShippedOrDeliverdWidget(
                    text: 'Processing'),
              if (buildOrder.orderActiveIndex == 1 &&
                  buildOrder.shipped.isEmpty)
                const NoProccessingorShippedOrDeliverdWidget(text: 'Shipped'),
              if (buildOrder.orderActiveIndex == 2 &&
                  buildOrder.delivered.isEmpty)
                const NoProccessingorShippedOrDeliverdWidget(text: 'Delivered'),
              if (buildOrder.orderActiveIndex == 3 &&
                  buildOrder.notDelivered.isEmpty)
                const NoProccessingorShippedOrDeliverdWidget(
                    text: 'Not Delivered'),
              if ((buildOrder.orderActiveIndex == 0 &&
                      buildOrder.processing.isEmpty) ||
                  (buildOrder.orderActiveIndex == 1 &&
                      buildOrder.shipped.isEmpty) ||
                  (buildOrder.orderActiveIndex == 2 &&
                      buildOrder.delivered.isEmpty) ||
                  (buildOrder.orderActiveIndex == 3 &&
                      buildOrder.notDelivered.isEmpty))
                const Spacer(),
            ],
          );
        }
        return const NoNotificationAndOrdersWidget(
            text: 'No Orders yet', image: Assets.imagesNoOrders);
      },
    );
  }
}
