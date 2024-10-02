import 'package:flutter/material.dart';

import '../widgets/category_products_view_body.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoryProductsViewBody(),
    );
  }
}
