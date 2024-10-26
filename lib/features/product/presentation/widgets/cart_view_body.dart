import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../home/data/models/product_model.dart';
import 'cart_product_price_and_coupon_buttons_section.dart';
import '../../../../core/widgets/cart_product_widget.dart';
import 'cart_shipping_and_payment_section.dart';
import '../../../../core/widgets/back_and_text_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          const BackAndTextHeader(text: 'Cart'),
          const SizedBox(height: 24),
          CartProductWidget(
              size: buildApp.size,
              color: buildApp.color,
              productData: productData),
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
