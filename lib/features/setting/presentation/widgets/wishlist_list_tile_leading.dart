import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/svg_model.dart';
import '../../../../core/widgets/custom_svg.dart';

class WishlistListTileLeading extends StatelessWidget {
  const WishlistListTileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;
    return CustomSvg(
        svgModel: SvgModel(
            height: 24,
            image: Assets.imagesUnfav,
            colorFilter: ColorFilter.mode(
                isDarkMode
                    ? AppColors.whiteColor
                    : AppColors.blackColor.withOpacity(.8),
                BlendMode.srcIn)));
  }
}
