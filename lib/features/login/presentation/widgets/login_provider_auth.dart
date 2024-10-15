import 'package:e_clot_shop/features/login/presentation/widgets/bloc_consumer_github_auth.dart';
import 'package:flutter/material.dart';

import 'bloc_consumer_google_auth.dart';
import 'bloc_consumer_twitter_auth.dart';

class LoginProviderAuth extends StatelessWidget {
  const LoginProviderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BlocConsumerTwitterAuth(),
        SizedBox(height: 16),
        BlocConsumerGoogleAuth(),
        // SizedBox(height: 16),
        // BlocConsumerFacebookAuth(),
        SizedBox(height: 16),
        BlocConsumerGithubAuth()
      ],
    );
  }
}
