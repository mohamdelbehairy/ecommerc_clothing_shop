import 'package:flutter/material.dart';

import '../../features/home/data/models/product_model.dart';
import 'data_product_list_view.dart';
import 'no_data_product_list_view.dart';

class CustomProductsListView extends StatelessWidget {
  const CustomProductsListView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? DataProductListView(products: products)
        : const NoDataProudctListView();
  }
}
