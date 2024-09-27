import 'package:flutter/material.dart';

import '../widgets/check_email_view_body.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  CheckEmailViewBody(),
    );
  }
}


