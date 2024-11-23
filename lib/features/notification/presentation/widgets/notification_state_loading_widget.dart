import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/loading_animation_widget.dart';
import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';

class NotificationStateLoadingWidget extends StatelessWidget {
  const NotificationStateLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        loadingAnimationWidget(
            color: context.read<ChangeThemeCubit>().isDarkMode
                ? AppColors.whiteColor
                : null),
        const Spacer(),
      ],
    ));
  }
}
