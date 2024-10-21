import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/svg_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../../core/widgets/custom_svg.dart';
import '../../data/models/shipping_and_payment_model.dart';

class CartShippingAndPaymentItem extends StatelessWidget {
  const CartShippingAndPaymentItem(
      {super.key, required this.shippingAndPaymentModel});
  final ShippingAndPaymentModel shippingAndPaymentModel;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadius: 8,
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(shippingAndPaymentModel.title,
                    style: Styles.styleMediumWithOpacity12)),
            subtitle: Text(shippingAndPaymentModel.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.styleMedium16),
            trailing: Transform.rotate(
              angle: 90 * 3.1415927 / 90,
              child: CustomSvg(
                  svgModel: SvgModel(
                      onTap: shippingAndPaymentModel.onTap,
                      height: 18,
                      image: Assets.imagesBack)),
            ),
          ),
        ),
      ),
    );
  }
}
