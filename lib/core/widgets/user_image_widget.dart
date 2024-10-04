import 'package:flutter/material.dart';

import '../models/cached_network_image_model.dart';
import 'custom_cached_network_image.dart';
import 'custom_placeholder_widget.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key, required this.imageModel});
  final CachedNetworkImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
        cachedImage: CachedNetworkImageModel(
            height: imageModel.height,
            width: imageModel.width,
            borderRadius: imageModel.borderRadius,
            imageUrl: imageModel.imageUrl,
            placeholder: CustomPlaceholderWidget(
                height: imageModel.height,
                width: imageModel.width,
                borderRadius: imageModel.borderRadius)));
  }
}
