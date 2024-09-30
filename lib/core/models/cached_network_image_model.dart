import 'package:flutter/material.dart';

class CachedNetworkImageModel {
  final String imageUrl;
  final double? height, width;
  final double borderRadius;
  final BoxFit? fit;
  final Widget? placeholder, errorWidget;

  CachedNetworkImageModel(
      {required this.imageUrl,
      this.height,
      this.width,
      this.borderRadius = 0,
      this.fit,
      this.placeholder,
      this.errorWidget});
}
