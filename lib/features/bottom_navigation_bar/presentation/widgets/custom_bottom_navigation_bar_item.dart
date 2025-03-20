import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/bottom_navigation_bar_model.dart';

BottomNavigationBarItem customBottomNavigationBarItem(
    BottomNavigationBarModel model, bool isActive, BuildContext context) {
  return BottomNavigationBarItem(
      icon: CustomSvg(
          svgModel: SvgModel(
              height: 30,
              image: model.icon,
              colorFilter: ColorFilter.mode(
                  isActive
                      ? model.activeColor
                      : context.watch<BuildAppCubit>().isDarkMode
                          ? Colors.white.withValues(alpha:  .5)
                          : model.inActiveColor,
                  BlendMode.srcIn))),
      label: '');
}
