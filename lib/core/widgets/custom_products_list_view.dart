import 'package:flutter/material.dart';

import '../../features/home/data/models/product_model.dart';
import '../models/custom_product_model.dart';
import 'product_item_widget.dart';

class CustomProductsListView extends StatelessWidget {
  const CustomProductsListView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductItemWidget(
                  customProductModel: CustomProductModel(
                      width: 165, productModel: products[index]),
                ));
          }),
    );
  }
}
