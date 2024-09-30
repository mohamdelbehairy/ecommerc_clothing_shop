import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_setting/build_setting_cubit.dart';
import '../widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildSettingCubit(),
      child: const Scaffold(
        body: SettingViewBody(),
      ),
    );
  }
}
