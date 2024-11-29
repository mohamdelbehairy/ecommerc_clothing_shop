import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class OrderHeaderItem extends StatelessWidget {
  const OrderHeaderItem(
      {super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;
    return CustomBakgroundAnimatedContainer(
      backgroundModel: BackgroundModel(
          color: isActive
              ? AppColors.primaryColor
              : isDarkMode
                  ? AppColors.darkModeSecondryColor
                  : null,
          borderRadiusDouble: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(text,
                style: isActive
                    ? Styles.styleMedium12(context)
                        .copyWith(color: Colors.white)
                    : Styles.styleMedium12(context)),
          )),
    );
  }
}
