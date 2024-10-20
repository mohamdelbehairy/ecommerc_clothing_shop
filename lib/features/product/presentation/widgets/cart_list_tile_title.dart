import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../home/data/models/product_model.dart';

class CartListTileTitle extends StatelessWidget {
  const CartListTileTitle({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(productData.name, style: Styles.styleMedium12),
          Text('\$${productData.price}', style: Styles.styleBoldGarabito12),
        ],
      ),
    );
  }
}
