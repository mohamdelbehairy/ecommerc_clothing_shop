import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_svg.dart';

class CartCouponPrefixIcon extends StatelessWidget {
  const CartCouponPrefixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSvg(
        svgModel: SvgModel(image: Assets.imagesCoupon, fit: BoxFit.scaleDown));
  }
}
