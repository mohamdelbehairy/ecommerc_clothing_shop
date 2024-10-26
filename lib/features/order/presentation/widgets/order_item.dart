import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/svg_model.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/back_right_widget.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../../core/widgets/custom_svg.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: Text('Order  #456765', style: Styles.styleMedium16),
          subtitle: Text('4 items', style: Styles.styleMediumWithOpacity12),
          trailing: BackRightWidget(onTap: () {}),
        ),
      ),
    ));
  }
}
