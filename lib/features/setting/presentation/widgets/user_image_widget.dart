import 'package:e_clot_shop/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      cachedImage: CachedNetworkImageModel(
          height: 100,
          width: 100,
          borderRadius: 100,
          imageUrl: imageUrl,
          placeholder: CustomFadingWidget(
              child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(100)),
          ))),
    );
  }
}
