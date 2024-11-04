import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/back_widget.dart';
import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../data/models/setting_item_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.settingItemModel});
  final SettingItemModel settingItemModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: settingItemModel.onTap,
      child: CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            height: 56,
            borderRadiusDouble: 8,
            color: isDarkMode ? AppColors.darkModeSecondryColor : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(settingItemModel.name,
                    style: Styles.styleMedium16(context)),
                BackWidget(backWidgetModel: BackWidgetModel())
              ],
            )),
      ),
    );
  }
}
