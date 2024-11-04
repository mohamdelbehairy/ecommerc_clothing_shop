import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';

Future<dynamic> customBottomSheet(BuildContext context,
    {required Widget child}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          decoration: BoxDecoration(
              color: context.watch<ChangeThemeCubit>().isDarkMode
                  ? AppColors.darkModePrimaryColor
                  : Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: child));
}
