import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_forget_password/build_forget_password_cubit.dart';
import '../widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildForgetPasswordCubit(),
      child: const Scaffold(
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
