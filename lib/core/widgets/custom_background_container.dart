import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBakgroundContainer extends StatelessWidget {
  const CustomBakgroundContainer({super.key, required this.backgroundModel});
  final BackgroundModel backgroundModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: backgroundModel.onTap,
      child: Container(
        height: backgroundModel.height,
        width: backgroundModel.width,
        decoration: BoxDecoration(
            color: backgroundModel.color ?? AppColors.secondaryColor,
            borderRadius: backgroundModel.borderRadius ??
                BorderRadius.circular(backgroundModel.borderRadiusDouble)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: backgroundModel.padding),
            child: backgroundModel.child),
      ),
    );
  }
}

class CustomBakgroundAnimatedContainer extends StatelessWidget {
  const CustomBakgroundAnimatedContainer(
      {super.key, required this.backgroundModel});
  final BackgroundModel backgroundModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: backgroundModel.height,
      width: backgroundModel.width,
      decoration: BoxDecoration(
          color: backgroundModel.color ?? AppColors.secondaryColor,
          borderRadius: backgroundModel.borderRadius ??
              BorderRadius.circular(backgroundModel.borderRadiusDouble)),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: backgroundModel.padding),
          child: backgroundModel.child),
    );
  }
}
