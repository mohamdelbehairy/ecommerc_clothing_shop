import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/social_auth/social_auth_cubit.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerFacebookAuth extends StatelessWidget {
  const BlocConsumerFacebookAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var facebookAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) {
        if (state is FacebookAuthLoading) {
          facebookAuth.isLoadingFacebook = state.isLoading;
        }
        if (state is FacebookAuthSuccess) {
          facebookAuth.isLoadingFacebook = false;
          showAlertSignInSuccessful(context);
        }
        if (state is SocialAuthFailure) {
          facebookAuth.isLoadingFacebook = false;
          // customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: facebookAuth.isLoadingFacebook,
                icon: Assets.imagesFacebook,
                text: 'Continue With Facebook',
                onTap: () async {
                  await facebookAuth.signInWIthFacebook();
                }));
      },
    );
  }
}
