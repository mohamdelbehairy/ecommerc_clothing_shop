import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';

class SearchCloseIcon extends StatelessWidget {
  const SearchCloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;

    return Icon(Icons.close,
        size: 16,
        color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor);
  }
}
