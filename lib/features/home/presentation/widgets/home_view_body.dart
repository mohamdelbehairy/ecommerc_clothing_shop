import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'home_when_state_success.dart';
import 'skeletonizer/home_when_state_loading.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return HomeWhenStateSuccess(userData: state.user);
        }
        return const HomeWhenStateLoading();
      },
    );
  }
}
