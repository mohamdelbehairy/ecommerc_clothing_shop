import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/widgets/categories_view_list_view.dart';

class CategoriesHeaderAndListViewSection extends StatelessWidget {
  const CategoriesHeaderAndListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop by Categories', style: Styles.styleBoldGarabito24(context)),
        const SizedBox(height: 16),
        const CategoriesViewListView(),
      ],
    );
  }
}
