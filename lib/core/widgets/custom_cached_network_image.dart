import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/cached_network_image_model.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.cachedImage});
  final CachedNetworkImageModel cachedImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cachedImage.borderRadius),
      child: CachedNetworkImage(
          height: cachedImage.height,
          width: cachedImage.width,
          fit: cachedImage.fit,
          placeholder: (context, url) =>
              cachedImage.placeholder ?? const SizedBox(),
          errorWidget: (context, url, error) =>
              cachedImage.errorWidget ?? const SizedBox(),
          imageUrl: cachedImage.imageUrl),
    );
  }
}
