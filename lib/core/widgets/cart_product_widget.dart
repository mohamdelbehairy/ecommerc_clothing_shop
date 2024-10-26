import 'package:flutter/material.dart';

import '../models/background_model.dart';
import 'custom_background_container.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/product/presentation/widgets/cart_product_list_tile.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget(
      {super.key,
      required this.productData,
      this.isOrder = false,
      this.isProduct = false, required this.size, required this.color});

  final ProductModel productData;
  final String size, color;
  final bool isOrder, isProduct;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 80,
        borderRadiusDouble: 8,
        child: Center(
            child: CartProductListTile(
                size: size,
                color: color,
                isOrder: isOrder,
                isProduct: isProduct,
                productData: productData)),
      ),
    );
  }
}
