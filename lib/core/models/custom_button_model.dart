import 'package:flutter/material.dart';

class CustomButtonModel {
  final Function()? onTap;
  final String buttonName;
  final bool isLoading;
  final double? width;
  final Color? buttonColor;

  CustomButtonModel(
      {this.onTap,
      required this.buttonName,
      this.isLoading = false,
      this.width,
      this.buttonColor});
}
