import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import 'profile_image_positioned_icon.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.cachedImagel,
  });
  final CachedNetworkImageProviderModel cachedImagel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedNetworkImageProvider(cachedImage: cachedImagel),
        const Positioned(
            right: 0.0, bottom: 10.0, child: ProfileImagePositionedIcon())
      ],
    );
  }
}
