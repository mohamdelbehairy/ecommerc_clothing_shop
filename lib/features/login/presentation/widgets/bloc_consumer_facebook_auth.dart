import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/facebook_auth/facebook_auth_cubit.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerFacebookAuth extends StatelessWidget {
  const BlocConsumerFacebookAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var facebookAuth = context.read<FacebookAuthCubit>();
    return BlocConsumer<FacebookAuthCubit, FacebookAuthState>(
      listener: (context, state) {
        if (state is FacebookAuthLoading) {
          facebookAuth.isLoading = state.isLoading;
        }
        if (state is FacebookAuthSuccess) {
          facebookAuth.isLoading = false;
        }
        if (state is FacebookAuthFailure) {
          facebookAuth.isLoading = false;
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: facebookAuth.isLoading,
                icon: Assets.imagesFacebook,
                text: 'Continue With Facebook',
                onTap: () async {
                  await facebookAuth.signInWIthFacebook();
                }));
      },
    );
  }
}
