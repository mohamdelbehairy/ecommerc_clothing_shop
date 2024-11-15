import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'cart_coupon_code_widget.dart';
import 'cart_product_button_place_order.dart';
import 'cart_product_price_list_view.dart';

class CartProductPriceAndCouponButtonsSection extends StatelessWidget {
  const CartProductPriceAndCouponButtonsSection(
      {super.key, required this.productData, required this.userData});
  final ProductModel productData;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartProductPriceListView(productData: productData),
        const SizedBox(height: 24),
        const CartCouponCodeWidget(),
        if (MediaQuery.sizeOf(context).width >= 375) const SizedBox(height: 64),
        if (MediaQuery.sizeOf(context).width < 375) const SizedBox(height: 24),
        CartProductButtonPlaceOrder(
            userData: userData, productData: productData),
      ],
    );
  }
}
