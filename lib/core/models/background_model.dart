import 'package:flutter/material.dart';

class BackgroundModel {
  final Widget child;
  final double? height;
  final double borderRadius, borderRadius2;

  BackgroundModel(
      {required this.child,
      this.height,
      required this.borderRadius,
      this.borderRadius2 = 16});
}
