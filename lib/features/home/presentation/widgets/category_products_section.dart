import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/product/product_cubit.dart';
import 'category_products_grid_view.dart';
import 'function/check_get_products.dart';

class CategoryProductsSection extends StatelessWidget {
  const CategoryProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var productsData = getProducts(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${productsData.header} (${productsData.products.length})',
                style: Styles.styleBold16),
            const SizedBox(height: 16),
            CategoryProductsGridView(products: productsData.products),
          ],
        );
      },
    );
  }

  
}
