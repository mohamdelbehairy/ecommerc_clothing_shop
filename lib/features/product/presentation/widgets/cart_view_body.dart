import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'cart_product_price_and_buttons_section.dart';
import 'cart_product_widget.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          const CartViewHeader(),
          const SizedBox(height: 24),
          CartProductWidget(productData: productData),
          const Spacer(),
          CartProductPriceAndButtonsSection(productData: productData),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
