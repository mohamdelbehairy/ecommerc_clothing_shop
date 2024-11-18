import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';

class AgeRangeWidget extends StatelessWidget {
  const AgeRangeWidget({super.key, required this.age});
  final String age;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return Container(
      height: 56,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(left: 20, right: 26),
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(age.isNotEmpty ? '$age years' : 'Age Range',
                style: Styles.styleMedium16(context)),
            BackWidget(
                backWidgetModel: BackWidgetModel(
                    angle: -3.14 / 2,
                    hight: 18,
                    colorFilter: ColorFilter.mode(
                        isDarkMode ? Colors.white : Colors.black,
                        BlendMode.srcIn)))
          ],
        ),
      ),
    );
  }
}
