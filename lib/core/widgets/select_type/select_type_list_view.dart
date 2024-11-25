import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/custom_button_model.dart';
import '../../models/select_type_model.dart';

class SelectTypeListView extends StatelessWidget {
  const SelectTypeListView({super.key, required this.selectTypeModel});
  final SelectTypeModel selectTypeModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
          onTap: selectTypeModel.onTap1,
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonColor: selectTypeModel.activeIndex == 0
                      ? null
                      : isDarkMode.isDarkMode
                          ? AppColors.darkModeSecondryColor
                          : AppColors.secondaryColor,
                  width: 161,
                  buttonName: 'Men'))),
      if (MediaQuery.sizeOf(context).width <= 360) const SizedBox(width: 12),
      GestureDetector(
          onTap: selectTypeModel.onTap2,
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  buttonColor: selectTypeModel.activeIndex == 1
                      ? null
                      : isDarkMode.isDarkMode
                          ? AppColors.darkModeSecondryColor
                          : AppColors.secondaryColor,
                  width: 161,
                  buttonName: 'Women')))
    ]);
  }
}
