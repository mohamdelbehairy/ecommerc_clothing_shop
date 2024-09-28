import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/tell_us/tell_us_cubit.dart';
import '../widgets/tell_about_view_body.dart';

class TellAboutView extends StatelessWidget {
  const TellAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TellUsCubit(),
      child: const Scaffold(body: TellAboutViewBody()),
    );
  }
}
