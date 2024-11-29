import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_data/data/models/user_data_model.dart';

class HomeSelectTypeWidget extends StatelessWidget {
  const HomeSelectTypeWidget({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor),
      child: Row(
        children: [
          Text(userData.type == 0 ? 'Men' : 'Women',
              style: Styles.styleBoldGarabito12(context)),
          const SizedBox(width: 10),
          BackWidget(
              backWidgetModel: BackWidgetModel(hight: 14, angle: -3.14 * 0.5))
        ],
      ),
    );
  }
}
