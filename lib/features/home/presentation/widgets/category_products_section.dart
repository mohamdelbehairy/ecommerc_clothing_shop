import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_home/build_home_cubit.dart';
import '../manager/product/product_cubit.dart';
import 'category_products_grid_view.dart';

class CategoryProductsSection extends StatelessWidget {
  const CategoryProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildHome = context.read<BuildHomeCubit>();
    var productCubit = context.read<ProductCubit>();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        List<ProductModel> products;
        String header;
        if (buildHome.activeIndex == 0) {
          products = productCubit.hoddies;
          header = Constants.hoodies;
        } else if (buildHome.activeIndex == 3) {
          products = productCubit.bags;
          header = Constants.bags;
        } else {
          products = [];
          header = '';
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$header (${products.length})', style: Styles.styleBold16),
            const SizedBox(height: 16),
            CategoryProductsGridView(products: products),
          ],
        );
      },
    );
  }
}
