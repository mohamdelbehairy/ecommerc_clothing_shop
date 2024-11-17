import 'package:e_clot_shop/features/profile/presentation/manager/build_profile/build_profile_cubit.dart';
import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_when_state_success.dart';

class ProfileViewBlocBuilder extends StatelessWidget {
  const ProfileViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var buildProfile = context.read<BuildProfileCubit>();
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
      if (state is GetUserDataSuccess) {
        buildProfile.userName.text = state.user.userName;
        return ProfileWhenStateSuccess(userData: state.user);
      }
      return const SizedBox();
    });
  }
}
