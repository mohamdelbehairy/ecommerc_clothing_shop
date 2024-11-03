import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';

class NotificationListTileLeading extends StatelessWidget {
  const NotificationListTileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomSvg(
            svgModel: SvgModel(
                height: 26,
                image: Assets.imagesNotificationbing,
                colorFilter: ColorFilter.mode(
                  context.read<ChangeThemeCubit>().isDarkMode
                      ? Colors.white
                      : Colors.black,
                  BlendMode.srcIn,
                ))),
        const Positioned(
          right: 2,
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Color(0xffFA3636),
          ),
        )
      ],
    );
  }
}
