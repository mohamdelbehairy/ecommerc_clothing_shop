import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/forget_password_and_reset.dart';

class LoginPasswordTextFieldAndButtonSetcion extends StatelessWidget {
  const LoginPasswordTextFieldAndButtonSetcion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            textFieldModel: TextFieldModel(
                hintText: 'Password',
                controller: TextEditingController())),
        const SizedBox(height: 20),
        CustomButton(
            customButtonModel:
                CustomButtonModel(onTap: () {}, buttonName: 'Continue')),
        const SizedBox(height: 20),
        const ForgetPasswordAndReset()
      ],
    );
  }
}