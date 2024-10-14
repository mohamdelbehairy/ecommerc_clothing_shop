import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWishlistWidget extends StatelessWidget {
  const HomeWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.primaryColor,
      child: CustomSvg(
          svgModel: SvgModel(
              onTap: () => GoRouter.of(context).push(AppRouter.wishlist),
              height: 20,
              image: Assets.imagesBag2)),
    );
  }
}
