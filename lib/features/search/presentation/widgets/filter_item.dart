import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_background_container.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            height: 27,
            borderRadiusDouble: 100,
            padding: 8,
            color: AppColors.primaryColor,
            child: Row(
              children: [
                CustomSvg(svgModel: SvgModel(image: Assets.imagesFilter)),
                const SizedBox(width: 4),
                Text('3',
                    style: Styles.styleMedium12(context)
                        .copyWith(color: AppColors.whiteColor))
              ],
            )),
      ),
    );
  }
}
