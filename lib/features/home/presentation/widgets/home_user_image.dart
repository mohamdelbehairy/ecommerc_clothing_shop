import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../user_data/data/models/user_data_model.dart';

class HomeUserImage extends StatelessWidget {
  const HomeUserImage({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImageProvider(
        cachedImage: CachedNetworkImageProviderModel(
            raduis: 22, imageUrl: userData.userImage));
  }
}
