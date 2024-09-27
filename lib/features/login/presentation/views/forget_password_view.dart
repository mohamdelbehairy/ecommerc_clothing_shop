import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/auth/data/repo/email_auth/email_auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/forget_password/forget_password_cubit.dart';
import '../manager/build_forget_password/build_forget_password_cubit.dart';
import '../widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BuildForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ForgetPasswordCubit(getIt.get<EmailAuthRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
