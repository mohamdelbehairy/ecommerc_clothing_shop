import 'package:flutter/material.dart';

import '../models/background_model.dart';
import 'custom_background_container.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/product/presentation/widgets/cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget(
      {super.key, required this.productData, this.isOrder = false});

  final ProductModel productData;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadiusDouble: 8,
        child: Center(
            child: CartProductListTile(
                isOrder: isOrder, productData: productData)),
      ),
    );
  }
}
