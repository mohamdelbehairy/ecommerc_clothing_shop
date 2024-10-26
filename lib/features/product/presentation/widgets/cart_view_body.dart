import 'package:flutter/material.dart';

import '../../../home/data/models/product_model.dart';
import 'cart_product_price_and_coupon_buttons_section.dart';
import '../../../../core/widgets/cart_product_widget.dart';
import 'cart_shipping_and_payment_section.dart';
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
          const SizedBox(height: 16),
          const CartShippingAndPaymentSection(),
          const Spacer(),
          CartProductPriceAndCouponButtonsSection(productData: productData),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
