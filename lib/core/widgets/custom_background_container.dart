import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBakgroundContainer extends StatelessWidget {
  const CustomBakgroundContainer({super.key, required this.backgroundModel});
  final BackgroundModel backgroundModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: backgroundModel.height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(backgroundModel.borderRadius)),
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: backgroundModel.borderRadius2),
          child: backgroundModel.child),
    );
  }
}
