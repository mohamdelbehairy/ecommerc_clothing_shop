import 'package:flutter/material.dart';

import '../../../user_data/data/models/user_data_model.dart';
import 'setting_list_view.dart';
import 'setting_user_image_and_info_section.dart';
import 'sign_out_button.dart';

class SettingWhenStateSuccess extends StatelessWidget {
  const SettingWhenStateSuccess({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const Spacer(flex: 3),
                SettingUserImageAndSection(userData: userData),
                const SizedBox(height: 16),
                const SettingListView(),
                const SizedBox(height: 16),
                SignOutButton(userData: userData),
                const Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
