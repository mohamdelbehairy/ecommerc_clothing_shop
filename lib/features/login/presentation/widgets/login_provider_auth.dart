import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../data/auth_item_model.dart';
import 'bloc_consumer_google_auth.dart';
import 'provider_auth_item.dart';

class LoginProviderAuth extends StatelessWidget {
  const LoginProviderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlocConsumerGoogleAuth(),
        const SizedBox(height: 16),
        ProviderAuthItem(
            authItemModel: AuthItemModel(
                icon: Assets.imagesFacebook,
                text: 'Continue With Facebook',
                onTap: () async {
                  // await GoogleSignIn().signOut();
                })),
      ],
    );
  }
}

