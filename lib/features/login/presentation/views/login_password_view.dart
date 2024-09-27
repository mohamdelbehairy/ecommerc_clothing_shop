import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/auth/data/repo/email_auth/email_auth_repo_impl.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/email_login/email_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_password_view_body.dart';

class LoginPasswordView extends StatelessWidget {
  const LoginPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailLoginCubit(getIt.get<EmailAuthRepoImpl>()),
      child: const Scaffold(
        body: LoginPasswordViewBody(),
      ),
    );
  }
}
