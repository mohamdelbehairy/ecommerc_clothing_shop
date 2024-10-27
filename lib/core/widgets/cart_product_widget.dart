import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:flutter/material.dart';

import '../models/background_model.dart';
import 'custom_background_container.dart';
import 'cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadiusDouble: 8,
        child: Center(
            child: CartProductListTile(
                cartProduct: cartProduct)),
      ),
    );
  }
}
