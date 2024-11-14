import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchFilterModel {
  final String? text;
  final Color background;
  final bool isBool;
  final Function() onTap;

  SearchFilterModel(
      {this.text,
      this.background = AppColors.primaryColor,
      this.isBool = true,
      required this.onTap});
}
