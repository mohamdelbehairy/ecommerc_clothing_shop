import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/social_auth/social_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerGithubAuth extends StatelessWidget {
  const BlocConsumerGithubAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var githubAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) {
        if (state is GithubAuthLoading) {
          githubAuth.isLoadingGithub = state.isLoading;
        }
        if (state is GithubAuthSuccess) {
          githubAuth.isLoadingGithub = false;
          showAlertSignInSuccessful(context);
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
