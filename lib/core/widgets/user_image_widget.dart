import 'package:e_clot_shop/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import '../models/cached_network_image_model.dart';
import 'custom_cached_network_image.dart';

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
          placeholder: CustomFadingWidget(
              child: Container(
            height: imageModel.height,
            width: imageModel.width,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(imageModel.borderRadius)),
          ))),
    );
  }
}
