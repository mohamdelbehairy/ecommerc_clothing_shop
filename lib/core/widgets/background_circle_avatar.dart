import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/svg_model.dart';
import '../utils/assets.dart';
import '../utils/colors.dart';
import 'custom_svg.dart';

class BackgroundCircleAvatar extends StatelessWidget {
  const BackgroundCircleAvatar(
      {super.key, this.image, this.height, this.onTap});
  final String? image;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return CircleAvatar(
      radius: 20,
      backgroundColor: isDarkMode
          ? AppColors.darkModeSecondryColor
          : AppColors.secondaryColor,
      child: CustomSvg(
          svgModel: SvgModel(
        onTap: onTap,
        height: height ?? 14,
        image: image ?? Assets.imagesBack,
        colorFilter: ColorFilter.mode(
            isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
      )),
    );
  }
}
