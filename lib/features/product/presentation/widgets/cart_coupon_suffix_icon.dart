import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/function/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/svg_model.dart';
import '../../../../core/widgets/custom_svg.dart';

class CartCouponSuffixIcon extends StatelessWidget {
  const CartCouponSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: GestureDetector(
        onTap: () {
          if (buildApp.couponFormKey.currentState!.validate()) {
            buildApp.couponFormKey.currentState!.save();
            buildApp.couponState();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            child: Transform.rotate(
              angle: 90 * 3.1415927 / 90,
              child: buildApp.isCouponLoading
                  ? loadingAnimationWidget(color: Colors.white, size: 20)
                  : CustomSvg(
                      svgModel: SvgModel(
                      image: Assets.imagesBack,
                      height: 16,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    )),
            ),
          ),
        ),
      ),
    );
  }
}
