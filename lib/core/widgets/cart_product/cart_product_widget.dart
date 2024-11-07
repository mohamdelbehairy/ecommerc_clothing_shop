import 'package:e_clot_shop/core/models/cart_product_model.dart';
import 'package:e_clot_shop/core/widgets/background_list_tiled.dart';
import 'package:flutter/material.dart';

import 'cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return BackgroundListTile(
      height: 80,
        child: Center(child: CartProductListTile(cartProduct: cartProduct)));
  }
}
