import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/show_products_section.dart';
import '../manager/product/product_cubit.dart';
import 'function/check_get_products.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var productsData = getProducts(context);
        return ShowProductsSection(productsData: productsData);
      },
    );
  }
}

