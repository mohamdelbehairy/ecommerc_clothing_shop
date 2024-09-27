import 'package:flutter/material.dart';

import 'bloc_consumer_facebook_auth.dart';
import 'bloc_consumer_google_auth.dart';

class LoginProviderAuth extends StatelessWidget {
  const LoginProviderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BlocConsumerGoogleAuth(),
        SizedBox(height: 16),
        BlocConsumerFacebookAuth(),
      ],
    );
  }
}

