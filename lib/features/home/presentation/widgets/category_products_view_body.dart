import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_widget.dart';
import 'category_products_section.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63),
          CustomBackWidget(),
          SizedBox(height: 16),
          Flexible(child: CategoryProductsSection())
        ],
      ),
    );
  }
}
