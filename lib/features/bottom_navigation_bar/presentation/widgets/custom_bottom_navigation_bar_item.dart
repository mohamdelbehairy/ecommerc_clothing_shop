  import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../data/models/bottom_navigation_bar_model.dart';

BottomNavigationBarItem customBottomNavigationBarItem(
      BottomNavigationBarModel model, bool isActive) {
    return BottomNavigationBarItem(
        icon: CustomSvg(
            svgModel: SvgModel(
                height: 30,
                image: model.icon,
                colorFilter: ColorFilter.mode(
                    isActive ? model.activeColor : model.inActiveColor,
                    BlendMode.srcIn))),
        label: '');
  }