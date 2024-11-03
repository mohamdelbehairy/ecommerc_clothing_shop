import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/category_item_model.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(categoryItem.image,height: 56,width: 56),
        const SizedBox(height: 4),
        Text(categoryItem.title, style: Styles.styleMedium12(context)),
      ],
    );
  }
}
