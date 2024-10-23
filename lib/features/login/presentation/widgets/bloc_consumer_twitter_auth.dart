import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/social_auth/social_auth_cubit.dart';
import '../../data/models/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerTwitterAuth extends StatelessWidget {
  const BlocConsumerTwitterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var twitterAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) {
        if (state is TwitterAuthLoading) {
          twitterAuth.isLoadingTwitter = state.isLoading;
        }
        if (state is TwitterAuthSuccess) {
          twitterAuth.isLoadingTwitter = false;
          showAlertSignInSuccessful(context);
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
