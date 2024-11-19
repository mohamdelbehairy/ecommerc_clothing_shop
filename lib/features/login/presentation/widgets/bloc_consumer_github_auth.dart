import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/social_auth/social_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_item_model.dart';
import 'function/state_success_login.dart';
import 'provider_auth_item.dart';

class BlocConsumerGithubAuth extends StatelessWidget {
  const BlocConsumerGithubAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var githubAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) async {
        if (state is GithubAuthLoading) {
          githubAuth.isLoadingGithub = state.isLoading;
        }
        if (state is GithubAuthSuccess) {
          githubAuth.isLoadingGithub = false;
          await stateSuccessLogin(context,Constants.github);
        }
        if (state is SocialAuthFailure) {
          githubAuth.isLoadingGithub = false;
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: githubAuth.isLoadingGithub,
                icon: Assets.imagesGithub,
                text: 'Continue With Github',
                onTap: () async {
                  await githubAuth.signInWithGithub(context);
                }));
      },
    );
  }
}
