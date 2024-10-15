import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerGithubAuth extends StatelessWidget {
  const BlocConsumerGithubAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderAuthItem(
        authItemModel: AuthItemModel(
            isLoading: false,
            icon: Assets.imagesGithub,
            text: 'Continue With Github',
            onTap: () async {}));
  }
}
