import 'package:flutter/material.dart';

import '../../../../core/models/custom_product_model.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../../data/models/product_model.dart';

class CategoryProductsGridView extends StatelessWidget {
  const CategoryProductsGridView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 0.0,
              childAspectRatio: 161 / 281),
          itemBuilder: (context, index) {
            return ProductItemWidget(
              customProductModel: CustomProductModel(
                  width: 180,
                  productModel: ProductModel(
                      id: 'id',
                      name: 'name',
                      price: 'price',
                      image: 'image',
                      category: 'category',
                      createdTime: DateTime.now())),
            );
          }),
    );
  }
}
