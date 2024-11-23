import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/cart_product_model.dart';
import '../../../../core/widgets/back_and_text_header.dart';
import '../../../../core/widgets/cart_product/cart_product_widget.dart';
import '../../../home/data/models/product_model.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'cart_product_price_and_coupon_buttons_section.dart';
import 'cart_shipping_and_payment_section.dart';

class CartViewWhenStateSuccess extends StatelessWidget {
  const CartViewWhenStateSuccess(
      {super.key, required this.productData, required this.userData});

  final ProductModel productData;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 63),
                const BackAndTextHeader(text: 'Cart'),
                const SizedBox(height: 24),
                CartProductWidget(
                    cartProduct: CartProductModel(
                        orderModel: OrderModel(
                            size: buildApp.size, color: buildApp.color),
                        productData: productData)),
                const SizedBox(height: 16),
                CartShippingAndPaymentSection(userData: userData),
                if (MediaQuery.sizeOf(context).width < 375)
                  const SizedBox(height: 16),
                if (MediaQuery.sizeOf(context).width >= 375) const Spacer(),
                CartProductPriceAndCouponButtonsSection(
                    productData: productData, userData: userData),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )
      ],
    );
  }
}
