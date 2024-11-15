import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'login_provider_auth.dart';
import 'login_text_field_and_button_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120),
            CustomHeaderText(text: 'Sign in'),
            SizedBox(height: 30),
            LoginTextFieldAndButtonsSection(),
            SizedBox(height: 80),
            LoginProviderAuth()
          ],
        ),
      ),
    );
  }
}
