import 'package:flutter/material.dart';

class CustomButtonModel {
  final Function()? onTap;
  final String buttonName;
  final bool isLoading;
  final double? height, width;
  final Color? buttonColor;
  final Widget? widget;

  CustomButtonModel(
      {this.onTap,
      required this.buttonName,
      this.isLoading = false,
      this.height,
      this.width,
      this.buttonColor,
      this.widget});
}
