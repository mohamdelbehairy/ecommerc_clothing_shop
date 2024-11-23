import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../models/cart_product_model.dart';

class SubTitleSizeAndColorWidget extends StatelessWidget {
  const SubTitleSizeAndColorWidget(
      {super.key, required this.cartProduct, required this.quantity});

  final CartProductModel cartProduct;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Size - ', style: Styles.styleMediumWithOpacity12(context)),
        Text(cartProduct.orderModel!.size!, style: Styles.styleBoldGarabito12(context)),
        const SizedBox(width: 24),
        Text('Color - ', style: Styles.styleMediumWithOpacity12(context)),
        Text(cartProduct.orderModel!.color!, style: Styles.styleBoldGarabito12(context)),
        if (cartProduct.isOrder && !cartProduct.isProduct)
          const SizedBox(width: 24),
        if (cartProduct.isOrder && !cartProduct.isProduct)
          Text('Quantity - ', style: Styles.styleMediumWithOpacity12(context)),
        if (cartProduct.isOrder && !cartProduct.isProduct)
          Text(quantity, style: Styles.styleBoldGarabito12(context)),
      ],
    );
  }
}
