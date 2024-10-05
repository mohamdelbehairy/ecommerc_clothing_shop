import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/show_products_section.dart';
import '../manager/product/product_cubit.dart';

class TopSellingViewBody extends StatelessWidget {
  const TopSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var topSelling = context.read<ProductCubit>();
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      return ShowProductsSection(productsData: (
        header: 'Top Selling',
        products: topSelling.topSelling
      ));
    });
  }
}
