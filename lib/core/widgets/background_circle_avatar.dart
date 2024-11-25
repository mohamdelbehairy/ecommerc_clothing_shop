import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_app/build_app_cubit.dart';
import '../models/svg_model.dart';
import '../utils/assets.dart';
import '../utils/colors.dart';
import 'custom_svg.dart';

class BackgroundCircleAvatar extends StatelessWidget {
  const BackgroundCircleAvatar(
      {super.key,
      this.image,
      this.height,
      this.onTap,
      this.isWishlisted = false});
  final String? image;
  final double? height;
  final Function()? onTap;
  final bool isWishlisted;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<BuildAppCubit>().isDarkMode;
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
            isWishlisted
                ? Colors.red
                : isDarkMode
                    ? AppColors.whiteColor
                    : AppColors.blackColor.withOpacity(.8),
            BlendMode.srcIn),
      )),
    );
  }
}
