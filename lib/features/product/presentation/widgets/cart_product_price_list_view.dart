import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../home/data/models/product_model.dart';
import 'cart_price_item.dart';

class CartProductPriceListView extends StatelessWidget {
  const CartProductPriceListView({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var price = num.parse(productData.price);
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: [
        CartPriceItem(
            title: 'Subtotal',
            value: '\$${(buildApp.quantity * price).toStringAsFixed(2)}'),
        const SizedBox(height: 16),
        CartPriceItem(
            title: 'Shipping Cost', value: '\$${buildApp.shippingCost}0'),
        const SizedBox(height: 16),
        CartPriceItem(title: 'Quantity', value: '${buildApp.quantity}'),
        const SizedBox(height: 16),
        CartPriceItem(
            title: 'Total',
            style: Styles.styleBold16,
            value:
                '\$${((buildApp.quantity * price) + buildApp.shippingCost).toStringAsFixed(2)}'),
      ],
    );
  }
}
