import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/svg_model.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/back_right_widget.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../../core/widgets/custom_svg.dart';
import '../views/order_details_view.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderData});

  final OrderModel orderData;

  @override
  Widget build(BuildContext context) {
    var number = int.parse(orderData.quantity);
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;

    return CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
      height: 72,
      borderRadiusDouble: 8,
      color: isDarkMode ? AppColors.darkModeSecondryColor : null,
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomSvg(
              svgModel: SvgModel(
                  height: 26,
                  colorFilter: ColorFilter.mode(
                      isDarkMode ? Colors.white : Colors.black,
                      BlendMode.srcIn),
                  image: Assets.imagesOrders)),
          title: Text('Order  #${orderData.orderID}',
              style: Styles.styleMedium16(context)),
          subtitle: Text(number > 1 ? '$number items' : '$number item',
              style: Styles.styleMediumWithOpacity12(context)),
          trailing: BackRightWidget(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderDetailsView(orderData: orderData))),
          ),
        ),
      ),
    ));
  }
}
