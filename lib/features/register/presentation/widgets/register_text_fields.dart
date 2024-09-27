import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textFieldModel: TextFieldModel(
              hintText: 'Firstname', controller: TextEditingController()),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          textFieldModel: TextFieldModel(
              hintText: 'Lastname', controller: TextEditingController()),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          textFieldModel: TextFieldModel(
              hintText: 'Email Address', controller: TextEditingController()),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          textFieldModel: TextFieldModel(
              hintText: 'Password', controller: TextEditingController()),
        ),
      ],
    );
  }
}
