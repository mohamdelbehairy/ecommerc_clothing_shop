import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_svg.dart';
import '../../data/models/product_select_details_model.dart';

class SizeAndColorSection extends StatelessWidget {
  const SizeAndColorSection(
      {super.key, required this.productSelectDetailsModel});

  final ProductSelectDetailsModel productSelectDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        productSelectDetailsModel.widget!,
        const SizedBox(width: 32),
        Transform.rotate(
            angle: -90 * 3.1415927 / 180,
            child: CustomSvg(
                svgModel: SvgModel(height: 18, image: Assets.imagesBack))),
        const SizedBox(width: 12),
      ],
    );
  }
}
