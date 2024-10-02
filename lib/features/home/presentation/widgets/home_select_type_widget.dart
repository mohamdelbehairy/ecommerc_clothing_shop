import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../user_data/data/models/user_data_model.dart';

class HomeSelectTypeWidget extends StatelessWidget {
  const HomeSelectTypeWidget({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.secondaryColor),
      child: Row(
        children: [
          Text(userData.type == 0 ? 'Men' : 'Women',
              style: Styles.styleBoldGarabito12),
          const SizedBox(width: 8),
          Transform.rotate(
              angle: -3.14 * 0.5,
              child: CustomSvg(svgModel: SvgModel(image: Assets.imagesBack)))
        ],
      ),
    );
  }
}
