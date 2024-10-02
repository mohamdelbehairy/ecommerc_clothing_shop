import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_back_widget.dart';
import 'package:flutter/material.dart';

import 'categories_view_list_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          const CustomBackWidget(),
          const SizedBox(height: 16),
          Text('Shop by Categories', style: Styles.styleBold24),
          const SizedBox(height: 16),
          const CategoriesViewListView(),
        ],
      ),
    );
  }
}


