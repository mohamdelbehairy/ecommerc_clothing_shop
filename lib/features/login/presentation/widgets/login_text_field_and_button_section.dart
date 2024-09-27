import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        CustomTextField(
            textFieldModel: TextFieldModel(
                hintText: 'Email Address',
                controller: TextEditingController())),
        const SizedBox(height: 20),
        CustomButton(
            customButtonModel: CustomButtonModel(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.loginPassword);
                },
                buttonName: 'Continue')),
        const SizedBox(height: 20),
        const DontHaveAccountAndCreateOne(),
      ],
    );
  }
}
