import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_header_widget.dart';
import 'forget_password_text_field_and_button_section.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        CustomHeaderWidget(text: 'Forgot Password'),
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ForgetPasswordTextFieldAndButtonSection()),
      ],
    );
  }
}


