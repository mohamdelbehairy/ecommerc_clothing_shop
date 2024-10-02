import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/user_image_widget.dart';
import '../../../user_data/data/models/user_data_model.dart';

class HomeUserImage extends StatelessWidget {
  const HomeUserImage({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return UserImageWidget(
        imageModel: CachedNetworkImageModel(
            height: 44,
            width: 44,
            borderRadius: 44,
            imageUrl: userData.userImage));
  }
}
