import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/back_and_text_header.dart';
import '../../../../core/widgets/cart_product/cart_product_widget.dart';
import '../../data/models/order_model.dart';
import 'order_details_text.dart';
import 'shipping_details_list_view.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.orderData});
  final OrderModel orderData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          BackAndTextHeader(text: 'Order  #${orderData.orderID}'),
          const SizedBox(height: 24),
          const OrderDetailsText(text: 'Order Items'),
          const SizedBox(height: 12),
          CartProductWidget(
              cartProduct: CartProductModel(
                  size: orderData.size,
                  color: orderData.color,
                  isProduct: true,
                  isShipped: true,
                  quantity: orderData.quantity,
                  orderID: orderData.id,
                  productData: orderData.productModel)),
          const SizedBox(height: 24),
          const OrderDetailsText(text: 'Shipping details'),
          const SizedBox(height: 12),
          ShippingDetailsListTile(
              shippingAddress: orderData.shippingAddress,
              shippingCost: orderData.shippingCost),
        ],
      ),
    );
  }
}
