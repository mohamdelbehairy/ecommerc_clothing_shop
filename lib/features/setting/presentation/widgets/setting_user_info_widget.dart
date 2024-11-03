import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';

class SettingUserInfoWidget extends StatelessWidget {
  const SettingUserInfoWidget({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        Text(userData.userName,
            style: Styles.styleBold16
                .copyWith(color: isDarkMode ? Colors.white : null)),
        const SizedBox(height: 6),
        Text(userData.email, style: Styles.styleMedium16WithOpacity(context)),
        const SizedBox(height: 6),
        Text('121-224-7890', style: Styles.styleMedium16WithOpacity(context)),
        const SizedBox(height: 13),
      ],
    );
  }
}
