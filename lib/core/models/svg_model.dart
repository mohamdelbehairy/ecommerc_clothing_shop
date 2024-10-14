import 'package:flutter/material.dart';

class SvgModel {
  final String image;
  final double? height, width;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  final Function()? onTap;

  SvgModel(
      {required this.image,
      this.height,
      this.width,
      this.fit = BoxFit.contain,
      this.colorFilter,
      this.onTap});
}
