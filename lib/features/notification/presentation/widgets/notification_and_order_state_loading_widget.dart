import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/loading_animation_widget.dart';

class NotificationAndOrderStateLoadingWidget extends StatelessWidget {
  const NotificationAndOrderStateLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        loadingAnimationWidget(
            color: context.read<BuildAppCubit>().isDarkMode
                ? AppColors.whiteColor
                : null),
        const Spacer(),
      ],
    ));
  }
}
