import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/select_type/select_type_cubit.dart';
import '../widgets/tell_about_view_body.dart';

class TellAboutView extends StatelessWidget {
  const TellAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectTypeCubit(),
      child: const Scaffold(body: TellAboutViewBody()),
    );
  }
}
