import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/show_products_section.dart';
import '../manager/product/product_cubit.dart';

class NewInViewBody extends StatelessWidget {
  const NewInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var newIn = context.read<ProductCubit>();
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      return ShowProductsSection(
        productsData: (header: 'New In', products: newIn.newIn),
      );
    });
  }
}
