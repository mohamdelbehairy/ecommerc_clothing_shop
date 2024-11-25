import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'circle_avatar_skeleronizer.dart';

class HomeHeaderSkeleronizer extends StatelessWidget {
  const HomeHeaderSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatarSkeleronizer(),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isDarkMode
                    ? AppColors.darkModeSecondryColor
                    : AppColors.secondaryColor),
            child: Row(
              children: [
                Text('Men', style: Styles.styleBoldGarabito12(context)),
                const SizedBox(width: 10),
                const CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(Assets.imagesHoodies)),
              ],
            ),
          ),
          const CircleAvatarSkeleronizer()
        ],
      ),
    );
  }
}
