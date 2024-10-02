import 'package:e_clot_shop/features/home/presentation/manager/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/categories_view_body.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    context.read<ProductCubit>().getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesViewBody(),
    );
  }
}
