import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_user_image.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'setting_user_info_section.dart';

class SettingUserImageAndSection extends StatelessWidget {
  const SettingUserImageAndSection({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomUserImage(userImage: userData.userImage),
        const SizedBox(height: 32),
        SettingUserInfoSection(userData: userData),
      ],
    );
  }
}


