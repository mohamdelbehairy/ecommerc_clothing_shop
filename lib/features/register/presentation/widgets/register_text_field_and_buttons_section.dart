import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/forget_password_and_reset.dart';
import 'register_text_fields.dart';

class RegisterTextFieldAndButtonsSection extends StatelessWidget {
  const RegisterTextFieldAndButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          const RegisterTextFields(),
          const SizedBox(height: 40),
          CustomButton(
              customButtonModel:
                  CustomButtonModel(onTap: () {}, buttonName: 'Continue')),
          const SizedBox(height: 30),
          const ForgetPasswordAndReset()
        ],
      ),
    );
  }
}
