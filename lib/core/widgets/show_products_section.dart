import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/models/product_model.dart';
import 'custom_products_grid_view.dart';

class ShowProductsSection extends StatelessWidget {
  const ShowProductsSection({super.key, required this.productsData});

  final ({String header, List<ProductModel> products}) productsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${productsData.header} (${productsData.products.length})',
            style: Styles.styleBold16(context)),
        const SizedBox(height: 16),
        CustomProductsGridView(products: productsData.products),
      ],
    );
  }
}
