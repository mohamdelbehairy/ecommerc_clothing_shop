import 'package:flutter/material.dart';

import '../models/cached_network_image_model.dart';
import 'user_image_widget.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({super.key, required this.userImage});

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: UserImageWidget(
          imageModel: CachedNetworkImageModel(
              height: 100, width: 100, borderRadius: 100, imageUrl: userImage)),
    );
  }
}