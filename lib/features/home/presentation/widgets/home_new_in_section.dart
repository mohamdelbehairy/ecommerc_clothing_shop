import 'package:e_clot_shop/core/widgets/custom_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/product/product_cubit.dart';
import 'home_new_in_header.dart';

class HomeNewInSection extends StatelessWidget {
  const HomeNewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    var newIn = context.watch<ProductCubit>();
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeNewInHeader()),
        const SizedBox(height: 16),
        Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CustomProductsListView(products: newIn.newIn))
      ],
    );
  }
}
