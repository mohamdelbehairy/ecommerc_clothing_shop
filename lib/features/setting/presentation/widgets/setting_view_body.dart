import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_list_view.dart';
import 'setting_user_image_and_info_section.dart';
import 'sign_out_button.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  SettingUserImageAndSection(userData: state.user),
                  const SizedBox(height: 24),
                  const SettingListView(),
                  const SizedBox(height: 24),
                  SignOutButton(userData: state.user),
                  const Spacer(),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
