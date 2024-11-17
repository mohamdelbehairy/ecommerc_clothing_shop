import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'setting_user_info_widget.dart';

class SettingUserInfoSection extends StatelessWidget {
  const SettingUserInfoSection({super.key, required this.userData});

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          color: context.watch<ChangeThemeCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : null,
          borderRadiusDouble: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingUserInfoWidget(userData: userData),
              GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.profile),
                child: Text('Edit',
                    style: Styles.styleBoldGarabito12(context)
                        .copyWith(color: AppColors.primaryColor)),
              )
            ],
          )),
    );
  }
}
