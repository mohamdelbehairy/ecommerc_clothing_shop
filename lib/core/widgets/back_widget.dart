import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_svg.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, required this.backWidgetModel});

  final BackWidgetModel backWidgetModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<BuildAppCubit>().isDarkMode;
    return Transform.rotate(
        angle: backWidgetModel.angle,
        child: CustomSvg(
          svgModel: SvgModel(
              height: backWidgetModel.hight,
              onTap: backWidgetModel.onTap,
              image: Assets.imagesBack,
              colorFilter: backWidgetModel.colorFilter ??
                  ColorFilter.mode(
                      isDarkMode ? Colors.white : AppColors.blackColor.withOpacity(.8),
                      BlendMode.srcIn)),
        ));
  }
}
