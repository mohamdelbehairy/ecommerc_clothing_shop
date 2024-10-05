import 'package:flutter/material.dart';

import '../../../../core/widgets/build_view_body.dart';
import '../widgets/category_products_body.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildViewBody(child: CategoryProductsBody()),
    );
  }
}
