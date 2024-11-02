import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import 'setting_dark_mode_list_view.dart';
import 'setting_dart_mode_button.dart';

class SettingDarkModeBottomSheet extends StatelessWidget {
  const SettingDarkModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomBottomSheetheader(text: 'Change Theme'),
        SizedBox(height: 8),
        SettingDarkModeListView(),
        SizedBox(height: 8),
        SettingDarkModeButton(),
        SizedBox(height: 24),
      ],
    );
  }
}

