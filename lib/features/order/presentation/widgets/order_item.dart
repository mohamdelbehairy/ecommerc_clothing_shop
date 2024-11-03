import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';

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
    return CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
      height: 72,
      borderRadiusDouble: 8,
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomSvg(
              svgModel: SvgModel(
                  height: 26,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  image: Assets.imagesOrders)),
          title:
              Text('Order  #${orderData.orderID}', style: Styles.styleMedium16(context)),
          subtitle: Text(number > 1 ? '$number items' : '$number item',
              style: Styles.styleMediumWithOpacity12),
          trailing: BackRightWidget(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderDetailsView(orderData: orderData))),
          ),
        ),
      ),
    ));
  }
}
