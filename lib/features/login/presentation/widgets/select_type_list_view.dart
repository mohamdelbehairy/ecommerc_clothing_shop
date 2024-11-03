import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../manager/tell_us/tell_us_cubit.dart';

class SelectTypeListView extends StatelessWidget {
  const SelectTypeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectType = context.watch<TellUsCubit>();
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
          onTap: () {
            selectType.activeIndexChange(0);
          },
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonColor: selectType.activeIndex == 0
                      ? null
                      : isDarkMode
                          ? AppColors.darkModeBackground
                          : AppColors.secondaryColor,
                  width: 161,
                  buttonName: 'Men'))),
      if (MediaQuery.sizeOf(context).width <= 360) const SizedBox(width: 12),
      GestureDetector(
          onTap: () {
            selectType.activeIndexChange(1);
          },
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonColor: selectType.activeIndex == 1
                      ? null
                      : isDarkMode
                          ? AppColors.darkModeBackground
                          : AppColors.secondaryColor,
                  width: 161,
                  buttonName: 'Women')))
    ]);
  }
}