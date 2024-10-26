import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'custom_svg.dart';

class BackRightWidget extends StatelessWidget {
  const BackRightWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * 3.1415927 / 90,
      child: CustomSvg(
          svgModel:
              SvgModel(onTap: onTap, height: 18, image: Assets.imagesBack)),
    );
  }
}