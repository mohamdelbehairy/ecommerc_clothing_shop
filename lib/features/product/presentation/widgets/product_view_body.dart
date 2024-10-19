import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'product_name_and_price_widget.dart';
import 'product_view_header.dart';
import 'product_view_images.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 63),
        const ProductViewHeader(),
        const SizedBox(height: 20),
        ProductViewImages(productData: productData),
        const SizedBox(height: 20),
        ProductNameAndPriceWidget(productData: productData),
      ],
    );
  }
}

