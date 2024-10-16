import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/explore_categories_button.dart';


class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            CustomSvg(svgModel: SvgModel(image: Assets.imagesEmptyCard)),
            const SizedBox(height: 24),
            Text('Your Cart is Empty', style: Styles.styleMedium24),
            const SizedBox(height: 24),
            const ExploreCategoriesButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
