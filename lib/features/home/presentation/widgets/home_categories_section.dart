import 'package:flutter/material.dart';

import 'home_categories_header.dart';
import 'home_category_itemd.dart';

class HomeCategoiresSection extends StatelessWidget {
  const HomeCategoiresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeCategoriesHeader(),
        SizedBox(height: 16),
        HomeCategoryItem(),
      ],
    );
  }
}
