import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'login_provider_auth.dart';
import 'login_text_field_and_button_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            child: LoginTextFieldAndButtonsSection()),
        SizedBox(height: 80),
        Padding(padding: EdgeInsets.symmetric(horizontal: 23), child: LoginProviderAuth())
      ],
    );
  }
}
