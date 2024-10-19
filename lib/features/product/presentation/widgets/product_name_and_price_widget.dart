import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';

class ProductNameAndPriceWidget extends StatelessWidget {
  const ProductNameAndPriceWidget({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productData.name, style: Styles.styleBold16),
          const SizedBox(height: 8),
          Text('\$${productData.price}',
              style: Styles.styleBold16.copyWith(color: AppColors.primaryColor))
        ],
      ),
    );
  }
}
