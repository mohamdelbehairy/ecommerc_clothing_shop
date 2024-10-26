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
          Flexible(
              child: Text(productData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleMedium12)),
          const SizedBox(width: 6),
          Text('\$${productData.price}', style: Styles.styleBoldGarabito12),
        ],
      ),
    );
  }
}
