import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/svg_model.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../../core/widgets/custom_svg.dart';

class CartCouponCodeWidget extends StatelessWidget {
  const CartCouponCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 56,
        borderRadius: 8,
        child: Row(
          children: [
            CustomSvg(svgModel: SvgModel(image: Assets.imagesCoupon)),
            const SizedBox(width: 16),
            Text('Enter Coupon Code', style: Styles.styleMediumWithOpacity12),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: Transform.rotate(
                angle: 90 * 3.1415927 / 90,
                child: CustomSvg(
                    svgModel: SvgModel(
                        image: Assets.imagesBack,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn))),
              ),
            )
          ],
        ),
      ),
    );
  }
}