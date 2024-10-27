import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/cart_product/cart_product_widget.dart';
import 'order_details_text.dart';
import 'order_placed_details_button.dart';
import 'shipping_details_list_view.dart';

class OrderPlacedDetailsViewBody extends StatelessWidget {
  const OrderPlacedDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          const Center(child: OrderDetailsText(text: 'Order Details')),
          const SizedBox(height: 24),
          const OrderDetailsText(text: 'Order Items'),
          const SizedBox(height: 12),
          CartProductWidget(
              cartProduct: CartProductModel(
                  size: buildApp.size,
                  color: buildApp.color,
                  isOrder: true,
                  productData: buildApp.productData!)),
          const SizedBox(height: 24),
          const OrderDetailsText(text: 'Shipping details'),
          const SizedBox(height: 12),
          ShippingDetailsListTile(
              shippingAddress: buildApp.shippingAddress,
              shippingCost: buildApp.shippingCost.toString()),
          const Spacer(),
          const OrderPlacedDetailsButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
