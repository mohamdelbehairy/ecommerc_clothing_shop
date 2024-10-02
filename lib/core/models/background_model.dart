import 'package:flutter/material.dart';

class BackgroundModel {
  final Widget child;
  final double? height, width;
  final double borderRadius, padding;

  BackgroundModel(
      {required this.child,
      this.height,
      this.width,
      this.borderRadius = 8,
      this.padding = 16});
}
