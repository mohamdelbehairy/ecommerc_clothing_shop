import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import '../widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductViewBody(productData: productData),
    );
  }
}
