import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../models/background_model.dart';
import 'custom_background_container.dart';

class BackgroundListTile extends StatelessWidget {
  const BackgroundListTile(
      {super.key, this.height, required this.child, this.padding, this.onTap});
  final double? height, padding;
  final Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;

    return CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            onTap: onTap,
            height: height ?? 72,
            padding: padding ?? 16,
            width: double.infinity,
            color: isDarkMode ? AppColors.darkModeSecondryColor : null,
            child: child));
  }
}
