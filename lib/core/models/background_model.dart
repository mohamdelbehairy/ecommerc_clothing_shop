import 'package:flutter/material.dart';

class BackgroundModel {
  final Widget child;
  final double? height, width;
  final double borderRadiusDouble, padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Function()? onTap;

  BackgroundModel(
      {required this.child,
      this.height,
      this.width,
      this.borderRadiusDouble = 8,
      this.padding = 16,
      this.borderRadius,
      this.color,
      this.onTap});
}
