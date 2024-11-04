import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            height: 44,
            padding: 20,
            borderRadiusDouble: 100,
            color: isDarkMode ? AppColors.darkModeSecondryColor : null,
            child: Row(
              children: [
                CustomSvg(
                    svgModel: SvgModel(
                        height: 18,
                        image: Assets.imagesSearch,
                        colorFilter: ColorFilter.mode(
                            isDarkMode
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                            BlendMode.srcIn))),
                const SizedBox(width: 12),
                Text('Search', style: Styles.styleMedium16(context))
              ],
            )),
      ),
    );
  }
}
