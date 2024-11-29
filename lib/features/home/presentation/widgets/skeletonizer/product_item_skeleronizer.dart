import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_background_container.dart';
import 'circle_avatar_skeleronizer.dart';

class ProductItemSkeleronizer extends StatelessWidget {
  const ProductItemSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>();
    return Stack(
      children: [
        CustomBakgroundContainer(
          backgroundModel: BackgroundModel(
              height: 281,
              width: 165,
              padding: 0.0,
              color: isDarkMode.isDarkMode
                  ? AppColors.darkModeSecondryColor
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBakgroundContainer(
                      backgroundModel: BackgroundModel(
                          height: 220,
                          width: double.infinity,
                          color: isDarkMode.isDarkMode
                              ? AppColors.darkModeSecondryColor
                              : null,
                          child: const SizedBox())),
                  const SizedBox(height: 6),
                  Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('customProductModel.productModel.name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.styleMedium12(context))),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text('\$${15}',
                        style: Styles.styleBoldGarabito12(context)),
                  )
                ],
              )),
        ),
        Positioned(
            right: MediaQuery.sizeOf(context).width == 480 ? 40 : 8,
            top: 8,
            child: const CircleAvatarSkeleronizer(radius: 10))
      ],
    );
  }
}
