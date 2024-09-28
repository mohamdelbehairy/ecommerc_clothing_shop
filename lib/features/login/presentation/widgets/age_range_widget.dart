import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_svg.dart';

class AgeRangeWidget extends StatelessWidget {
  const AgeRangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(left: 20, right: 26),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Age Range', style: Styles.styleMedium16),
            Transform.rotate(
                angle: -3.14 / 2,
                child: CustomSvg(
                    svgModel: SvgModel(image: Assets.imagesBack, height: 18)))
          ],
        ),
      ),
    );
  }
}
