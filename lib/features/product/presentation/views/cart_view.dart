import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartViewBody(productData: productData),
    );
  }
}
