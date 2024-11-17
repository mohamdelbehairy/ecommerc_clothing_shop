import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'setting_user_info_section.dart';

class SettingUserImageAndSection extends StatelessWidget {
  const SettingUserImageAndSection({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCachedNetworkImageProvider(
                  cachedImage: CachedNetworkImageProviderModel(
                      imageUrl: userData.userImage)),
        const SizedBox(height: 32),
        SettingUserInfoSection(userData: userData),
      ],
    );
  }
}


