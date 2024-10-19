import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../data/models/product_select_details_model.dart';

class ProductSelectDetailsWidget extends StatelessWidget {
  const ProductSelectDetailsWidget(
      {super.key, required this.productSelectDetailsModel});
  final ProductSelectDetailsModel productSelectDetailsModel;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 56,
        borderRadius: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productSelectDetailsModel.title, style: Styles.styleMedium16),
            Row(
              children: [
                Text('S', style: Styles.styleBold16),
                const SizedBox(width: 32),
                Transform.rotate(
                    angle: -90 * 3.1415927 / 180,
                    child: CustomSvg(
                        svgModel:
                            SvgModel(height: 18, image: Assets.imagesBack))),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
