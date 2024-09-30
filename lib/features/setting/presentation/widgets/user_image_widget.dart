import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      cachedImage: CachedNetworkImageModel(
          height: 100,
          width: 100,
          borderRadius: 100,
          imageUrl:
              'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1727588483~exp=1727589083~hmac=3fd0e98f8df60c4b50800385dbb7a0908ec97c5e1e8a648a9f6c6795cea3b8ac'),
    );
  }
}
