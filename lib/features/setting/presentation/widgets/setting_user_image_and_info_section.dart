import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'setting_background_container.dart';
import 'setting_user_info_widget.dart';
import 'user_image_widget.dart';

class SettingUserImageAndSection extends StatelessWidget {
  const SettingUserImageAndSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserImageWidget(),
        const SizedBox(height: 24),
        SettingBakgroundContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SettingUserInfoWidget(),
              Text('Edit',
                  style: Styles.styleBoldGarabito12
                      .copyWith(color: AppColors.primaryColor))
            ],
          ),
        ),
      ],
    );
  }
}
