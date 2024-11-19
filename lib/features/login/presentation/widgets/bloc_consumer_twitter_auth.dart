import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/social_auth/social_auth_cubit.dart';
import '../../data/models/auth_item_model.dart';
import 'function/state_success_login.dart';
import 'provider_auth_item.dart';

class BlocConsumerTwitterAuth extends StatelessWidget {
  const BlocConsumerTwitterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var twitterAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) async {
        if (state is TwitterAuthLoading) {
          twitterAuth.isLoadingTwitter = state.isLoading;
        }
        if (state is TwitterAuthSuccess) {
          twitterAuth.isLoadingTwitter = false;
          await stateSuccessLogin(context, Constants.twitter);
        }
        if (state is SocialAuthFailure) {
          twitterAuth.isLoadingTwitter = false;
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: twitterAuth.isLoadingTwitter,
                icon: Assets.imagesTwitter,
                text: 'Continue With Twitter',
                onTap: () async {
                  await twitterAuth.signInWithTwitter();
                }));
      },
    );
  }
}
