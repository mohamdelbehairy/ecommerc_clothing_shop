import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/background_model.dart';
import '../../../../../core/widgets/custom_background_container.dart';
import 'circle_avatar_skeleronizer.dart';

class HomeSearchSkeleronizer extends StatelessWidget {
  const HomeSearchSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;

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
                const CircleAvatarSkeleronizer(radius: 10),
                const SizedBox(width: 12),
                Text('Search', style: Styles.styleMedium16(context))
              ],
            )),
      ),
    );
  }
}
