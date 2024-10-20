import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'cart_product_buttons.dart';
import 'cart_product_price_list_view.dart';

class CartProductPriceAndButtonsSection extends StatelessWidget {
  const CartProductPriceAndButtonsSection(
      {super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    // var price = num.parse(productData.price);
    // var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: [
        CartProductPriceListView(productData: productData),
        const SizedBox(height: 24),
        const CartProductButtons(),
      ],
    );
  }
}


