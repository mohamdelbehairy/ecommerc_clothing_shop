import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/social_auth/social_auth_cubit.dart';
import '../../data/models/auth_item_model.dart';
import 'function/state_success_login.dart';
import 'provider_auth_item.dart';

class BlocConsumerGoogleAuth extends StatelessWidget {
  const BlocConsumerGoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var googleAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) async {
        if (state is GoogleAuthLoading) {
          googleAuth.isLoadingGoogle = state.isLoading;
        }
        if (state is GoogleAuthSuccess) {
          await stateSuccessLogin(context);
        }
        if (state is SocialAuthFailure) {
          googleAuth.isLoadingGoogle = false;
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: googleAuth.isLoadingGoogle,
                icon: Assets.imagesGoogle,
                text: 'Continue With Google',
                onTap: () async {
                  await googleAuth.signInWIthGoogle();
                }));
      },
    );
  }
}
