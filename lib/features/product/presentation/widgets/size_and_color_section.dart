import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/back_widget_model.dart';
import '../../../../core/widgets/back_widget.dart';
import '../../data/models/product_select_details_model.dart';

class SizeAndColorSection extends StatelessWidget {
  const SizeAndColorSection(
      {super.key,
      required this.productSelectDetailsModel,
      required this.onTap,
      required this.index});

  final ProductSelectDetailsModel productSelectDetailsModel;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Row(
      children: [
        if (index == 0)
          Text(buildApp.sizeList[buildApp.sizeIndex].title,
              style: Styles.styleBold16.copyWith(
                  color: context.read<ChangeThemeCubit>().isDarkMode
                      ? AppColors.whiteColor
                      : null)),
        if (index == 1)
          CircleAvatar(
              radius: 8,
              backgroundColor: buildApp.colorList[buildApp.colorIndex].color),
        if (index == 0) const SizedBox(width: 32),
        if (index == 1) const SizedBox(width: 28),
        BackWidget(
            backWidgetModel:
                BackWidgetModel(angle: -90 * 3.1415927 / 180, onTap: onTap)),
        const SizedBox(width: 12),
      ],
    );
  }
}
