import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarModel {
  final String icon;
  final Color activeColor, inActiveColor;

  BottomNavigationBarModel(
      {required this.icon,
      this.activeColor = AppColors.primaryColor,
      this.inActiveColor = const Color(0xff272727)});
}
