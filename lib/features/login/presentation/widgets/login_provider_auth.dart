import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/google_auth/google_auth_cubit.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class LoginProviderAuth extends StatelessWidget {
  const LoginProviderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [
      AuthItemModel(
          icon: Assets.imagesGoogle,
          text: 'Continue With Google',
          onTap: () async{
            await context.read<GoogleAuthCubit>().signInWIthGoogle();
          }),
      AuthItemModel(
          icon: Assets.imagesFacebook,
          text: 'Continue With Facebook',
          onTap: () {})
    ];
    return Column(
      children: List.generate(
          items.length,
          (index) => Padding(
              padding: EdgeInsets.only(bottom: index == 0 ? 16 : 0.0),
              child: ProviderAuthItem(authItemModel: items[index]))),
    );
  }
}
