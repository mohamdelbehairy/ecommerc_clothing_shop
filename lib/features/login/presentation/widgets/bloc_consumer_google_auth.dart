import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/google_auth/google_auth_cubit.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerGoogleAuth extends StatelessWidget {
  const BlocConsumerGoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var googleAuth = context.read<GoogleAuthCubit>();
    return BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) {
        if (state is GoogleAuthLoading) {
          googleAuth.isLoading = state.isLoading;
        }
        if (state is GoogleAuthSuccess) {
          googleAuth.isLoading = false;
        }
        if (state is GoogleAuthFailure) {
          googleAuth.isLoading = false;
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: googleAuth.isLoading,
                icon: Assets.imagesGoogle,
                text: 'Continue With Google',
                onTap: () async {
                  await googleAuth.signInWIthGoogle();
                }));
      },
    );
  }
}
