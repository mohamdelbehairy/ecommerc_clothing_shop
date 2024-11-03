import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/models/cached_network_image_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_background_container.dart';
import 'setting_user_info_widget.dart';
import '../../../../core/widgets/user_image_widget.dart';

class SettingUserImageAndSection extends StatelessWidget {
  const SettingUserImageAndSection({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserImageWidget(
            imageModel: CachedNetworkImageModel(
                height: 100,
                width: 100,
                borderRadius: 100,
                imageUrl: userData.userImage)),
        const SizedBox(height: 32),
        CustomBakgroundContainer(
          backgroundModel: BackgroundModel(
              color: context.watch<ChangeThemeCubit>().isDarkMode
                  ? AppColors.darkModeBackground
                  : null,
              borderRadiusDouble: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingUserInfoWidget(userData: userData),
                  Text('Edit',
                      style: Styles.styleBoldGarabito12
                          .copyWith(color: AppColors.primaryColor))
                ],
              )),
        ),
      ],
    );
  }
}
