import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/back_and_text_header.dart';
import '../../../../core/widgets/cart_product/cart_product_widget.dart';
import '../../data/models/order_model.dart';
import 'order_details_text.dart';
import 'shipping_details_list_view.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody(
      {super.key, required this.orderData, required this.isNotify});
  final OrderModel orderData;
  final bool isNotify;

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
                  orderModel: orderData,
                  isProduct: true,
                  isNotify: isNotify,
                  isShipped: orderData.orderType == Constants.orderShipped
                      ? true
                      : false,
                  productData: orderData.productModel)),
          const SizedBox(height: 24),
          const OrderDetailsText(text: 'Shipping details'),
          const SizedBox(height: 12),
          ShippingDetailsListTile(
              shippingAddress: orderData.shippingAddress!,
              shippingCost: orderData.shippingCost!),
        ],
      ),
    );
  }
}
