import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_order/build_order_cubit.dart';
import 'order_header_list_view.dart';
import 'order_item.dart';

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
          const OrderHeaderListView(),
          const SizedBox(height: 24),
          if (context.watch<BuildOrderCubit>().orderActiveIndex == 0)
            const OrderItem()
          // const NoNotificationAndOrdersWidget(
          //     text: 'No Orders yet', image: Assets.imagesNoOrders)
        ],
      ),
    );
  }
}


// String generateUniqueId() {
//       Random random = Random();
//       return (100000 + random.nextInt(900000)).toString();
//     }
