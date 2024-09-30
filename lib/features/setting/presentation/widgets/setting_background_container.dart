import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingBakgroundContainer extends StatelessWidget {
  const SettingBakgroundContainer(
      {super.key, this.height, required this.child});
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), child: child),
    );
  }
}
