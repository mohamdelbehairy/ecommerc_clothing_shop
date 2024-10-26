import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/no_notification_and_orders_widget.dart';
import '../../data/models/order_model.dart';
import '../manager/build_order/build_order_cubit.dart';
import '../manager/order/order_cubit.dart';
import 'order_header_list_view.dart';
import 'order_list_view.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          Center(child: Text('Orders', style: Styles.styleBold16)),
          const SizedBox(height: 24),
          const OrdersViewBodyDetails()
        ],
      ),
    );
  }
}

class OrdersViewBodyDetails extends StatelessWidget {
  const OrdersViewBodyDetails({super.key});

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
        } else {
          orders = order.delivered;
        }
        if (order.processing.isNotEmpty ||
            order.shipped.isNotEmpty ||
            order.delivered.isNotEmpty) {
          return Flexible(
            child: Column(
              children: [
                const OrderHeaderListView(),
                const SizedBox(height: 24),
                OrderListView(orders: orders),
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
