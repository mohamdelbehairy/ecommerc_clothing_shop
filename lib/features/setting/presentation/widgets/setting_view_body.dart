import 'package:flutter/material.dart';
import 'setting_list_view.dart';
import 'setting_user_image_and_info_section.dart';
import 'sign_out_button.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            SettingUserImageAndSection(),
            SizedBox(height: 24),
            SettingListView(),
            SizedBox(height: 24),
            SignOutButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

