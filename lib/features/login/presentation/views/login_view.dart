import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo_impl.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/facebook_auth/facebook_auth_cubit.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/google_auth/google_auth_cubit.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/social_auth/social_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GoogleAuthCubit(getIt.get<SocialAuthRepoImpl>())),
        BlocProvider(
            create: (context) =>
                FacebookAuthCubit(getIt.get<SocialAuthRepoImpl>())),
        BlocProvider(
            create: (context) =>
                SocialAuthCubit(getIt.get<SocialAuthRepoImpl>())),
      ],
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
