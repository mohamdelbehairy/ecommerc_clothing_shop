import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'cart_coupon_code_widget.dart';
import 'cart_product_button.dart';
import 'cart_product_price_list_view.dart';

class CartProductPriceAndCouponButtonsSection extends StatelessWidget {
  const CartProductPriceAndCouponButtonsSection(
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
        const CartCouponCodeWidget(),
        const SizedBox(height: 64),
        const CartProductButton(),
      ],
    );
  }
}
