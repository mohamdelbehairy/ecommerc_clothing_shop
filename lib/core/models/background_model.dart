import 'package:flutter/material.dart';

class BackgroundModel {
  final Widget child;
  final double? height, width;
  final double borderRadiusDouble, padding;
  final BorderRadiusGeometry? borderRadius;

  BackgroundModel(
      {required this.child,
      this.height,
      this.width,
      this.borderRadiusDouble = 8,
      this.padding = 16,
      this.borderRadius});
}
