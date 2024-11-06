import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../models/svg_model.dart';
import 'custom_svg.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;

    return CustomSvg(
        svgModel: SvgModel(
            height: 18,
            image: Assets.imagesSearch,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
                isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                BlendMode.srcIn)));
  }
}
