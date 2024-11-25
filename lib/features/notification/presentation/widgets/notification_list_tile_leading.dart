import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';

class NotificationListTileLeading extends StatelessWidget {
  const NotificationListTileLeading({super.key, required this.isSeen});
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomSvg(
            svgModel: SvgModel(
                height: 26,
                image: Assets.imagesNotificationbing,
                colorFilter: ColorFilter.mode(
                  context.read<BuildAppCubit>().isDarkMode
                      ? Colors.white
                      : Colors.black,
                  BlendMode.srcIn,
                ))),
        if (!isSeen)
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
