import 'package:flutter/material.dart';

class SvgModel {
  final String image;
  final double? height, width;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  SvgModel(
      {required this.image,
      this.height,
      this.width,
      this.fit = BoxFit.contain,
      this.colorFilter});
}