import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_svg.dart';

class BackRightWidget extends StatelessWidget {
  const BackRightWidget({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return Transform.rotate(
        angle: 180 * 3.1415927 / 180,
        child: CustomSvg(
          svgModel: SvgModel(
              height: 16,
              onTap: onTap,
              image: Assets.imagesBack,
              colorFilter: ColorFilter.mode(
                  isDarkMode ? Colors.white : AppColors.blcakColor, BlendMode.srcIn)),
        ));
  }
}
