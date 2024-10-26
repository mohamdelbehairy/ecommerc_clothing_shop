import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_background_container.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:e_clot_shop/features/order/presentation/manager/build_order/build_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/back_right_widget.dart';
import 'order_header_list_view.dart';

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
            CustomBakgroundContainer(
                backgroundModel: BackgroundModel(
              height: 72,
              borderRadiusDouble: 8,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomSvg(
                      svgModel: SvgModel(
                          height: 26,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                          image: Assets.imagesOrders)),
                  title: Text('Order  #456765', style: Styles.styleMedium16),
                  subtitle:
                      Text('4 items', style: Styles.styleMediumWithOpacity12),
                  trailing: BackRightWidget(onTap: () {}),
                ),
              ),
            ))
          // const NoNotificationAndOrdersWidget(
          //     text: 'No Orders yet', image: Assets.imagesNoOrders)
        ],
      ),
    );
  }
}
