import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, required this.userImage});
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImageProvider(
        cachedImage: CachedNetworkImageProviderModel(imageUrl: userImage));
  }
}
