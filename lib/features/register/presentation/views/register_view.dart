import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/setup_service_locator.dart';
import '../../../auth/data/repo/email_auth/email_auth_repo_impl.dart';
import '../../../auth/presentation/manager/email_register/email_register_cubit.dart';
import '../manager/build_register/build_register_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BuildRegisterCubit()),
        BlocProvider(
            create: (context) =>
                EmailRegisterCubit(getIt.get<EmailAuthRepoImpl>())),
      ],
      child: const Scaffold(body: RegisterViewBody()),
    );
  }
}
