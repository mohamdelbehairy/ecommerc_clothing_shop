import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_header_widget.dart';
import 'register_text_field_and_buttons_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        CustomHeaderWidget(text: 'Create Account'),
        SizedBox(height: 30),
        RegisterTextFieldAndButtonsSection(),
      ],
    );
  }
}
