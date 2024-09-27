import 'package:flutter/material.dart';

import '../widgets/login_password_view_body.dart';

class LoginPasswordView extends StatelessWidget {
  const LoginPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPasswordViewBody(),
    );
  }
}

