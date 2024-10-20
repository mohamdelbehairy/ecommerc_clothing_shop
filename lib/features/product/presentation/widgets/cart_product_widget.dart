import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import '../../../home/data/models/product_model.dart';
import 'cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadius: 8,
        child: Center(child: CartProductListTile(productData: productData)),
      ),
    );
  }
}
