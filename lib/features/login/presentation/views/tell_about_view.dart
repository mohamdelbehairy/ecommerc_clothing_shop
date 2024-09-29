import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/data/repo/user_data_repo_impl.dart';
import '../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';
import '../manager/tell_us/tell_us_cubit.dart';
import '../widgets/tell_about_view_body.dart';

class TellAboutView extends StatelessWidget {
  const TellAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TellUsCubit()),
        BlocProvider(
            create: (context) =>
                SaveUserDataCubit(getIt.get<UserDataRepoImpl>())),
      ],
      child: const Scaffold(body: TellAboutViewBody()),
    );
  }
}
