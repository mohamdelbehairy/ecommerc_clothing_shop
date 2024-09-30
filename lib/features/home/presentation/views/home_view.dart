import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetUserDataCubit>().getUserData();
    return const Scaffold();
  }
}