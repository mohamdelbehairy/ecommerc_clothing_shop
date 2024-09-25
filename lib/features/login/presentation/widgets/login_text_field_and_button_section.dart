import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'dont_have_account_and_create_one.dart';

class LoginTextFieldAndButtonsSection extends StatelessWidget {
  const LoginTextFieldAndButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(),
        const SizedBox(height: 20),
        CustomButton(
            customButtonModel:
                CustomButtonModel(onTap: () {}, buttonName: 'Continue')),
        const SizedBox(height: 20),
        const DontHaveAccountAndCreateOne(),
      ],
    );
  }
}

