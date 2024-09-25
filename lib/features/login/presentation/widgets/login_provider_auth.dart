import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class LoginProviderAuth extends StatelessWidget {
  const LoginProviderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(100)),
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Positioned(
            top: 0.0,
            bottom: 0.0,
            child: CustomSvg(svgModel: SvgModel(image: Assets.imagesGoogle, height: 24))),
          Align(
            alignment: Alignment.center,
            child: Text('Continue With Google', style: Styles.styleMedium16))
        ],
      ),
    );
  }
}
