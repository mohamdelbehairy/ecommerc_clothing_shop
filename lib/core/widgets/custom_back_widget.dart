import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).pop(),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.secondaryColor,
        child: CustomSvg(
            svgModel: SvgModel(height: 14, image: Assets.imagesBack)),
      ),
    );
  }
}
