import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'setting_background_container.dart';
import 'setting_user_info_widget.dart';
import 'user_image_widget.dart';

class SettingUserImageAndSection extends StatelessWidget {
  const SettingUserImageAndSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Column(
            children: [
               UserImageWidget(imageUrl: state.user.userImage),
              const SizedBox(height: 24),
              SettingBakgroundContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SettingUserInfoWidget(userData: state.user),
                    Text('Edit',
                        style: Styles.styleBoldGarabito12
                            .copyWith(color: AppColors.primaryColor))
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
