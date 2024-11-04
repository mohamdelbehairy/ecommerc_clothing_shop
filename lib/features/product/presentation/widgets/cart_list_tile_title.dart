import 'package:flutter/material.dart';

import '../../../../core/models/cart_product_model.dart';
import '../../../../core/utils/styles.dart';

class CartListTileTitle extends StatelessWidget {
  const CartListTileTitle({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(cartProduct.productData!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleMedium12(context))),
          const SizedBox(width: 6),
          Text(
              cartProduct.isProduct 
                  ? '\$${num.parse(cartProduct.productData!.price) * num.parse(cartProduct.quantity!)}'
                  : '\$${cartProduct.productData!.price}',
              style: Styles.styleBoldGarabito12(context)),
        ],
      ),
    );
  }
}
