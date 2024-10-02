import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../models/svg_model.dart';
import 'custom_svg.dart';
import 'product_item.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProductItem(),
        Positioned(
            right: 4,
            top: 4,
            child: CustomSvg(svgModel: SvgModel(image: Assets.imagesFavIcon)))
      ],
    );
  }
}