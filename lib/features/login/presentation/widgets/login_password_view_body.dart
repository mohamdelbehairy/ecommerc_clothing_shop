import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_header_text.dart';
import 'login_password_text_field_and_buttons_section.dart';

class LoginPasswordViewBody extends StatelessWidget {
  const LoginPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: CustomHeaderText(text: 'Sign in')),
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LoginPasswordTextFieldAndButtonSetcion()),
      ],
    );
  }
}


