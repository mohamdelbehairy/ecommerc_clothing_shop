import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';

class SettingDarkModeButton extends StatelessWidget {
  const SettingDarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
        customButtonModel: CustomButtonModel(
          buttonName: 'Save',
          onTap: () {},
        ),
      ),
    );
  }
}
