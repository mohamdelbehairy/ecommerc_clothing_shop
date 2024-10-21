import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_products_list_view.dart';
import '../manager/product/product_cubit.dart';
import 'home_top_selling_header.dart';

class HomeTopSellingSection extends StatelessWidget {
  const HomeTopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    var topSelling = context.watch<ProductCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeTopSellingHeader()),
        const SizedBox(height: 16),
        CustomProductsListView(products: topSelling.topSelling)
      ],
    );
  }
}
