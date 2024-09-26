import 'package:e_clot_shop/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/google_auth/google_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleAuthCubit(AuthRepoImpl()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
