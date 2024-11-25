import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_search/build_search_cubit.dart';

class SearchCloseIcon extends StatelessWidget {
  const SearchCloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;

    return GestureDetector(
      onTap: () => context.read<BuildSearchCubit>().clearSearch(),
      child: Icon(Icons.close,
          size: 16,
          color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor),
    );
  }
}
