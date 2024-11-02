import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class NotificationListTileLeading extends StatelessWidget {
  const NotificationListTileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomSvg(
            svgModel:
                SvgModel(height: 26, image: Assets.imagesNotificationbing)),
        const Positioned(
          right: 2,
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Color(0xffFA3636),
          ),
        )
      ],
    );
  }
}
