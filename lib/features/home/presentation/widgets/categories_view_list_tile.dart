import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/models/category_item_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class CategoriesViewListTile extends StatelessWidget {
  const CategoriesViewListTile({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 64,
        padding: 0.0,
        child: Center(
          child: ListTile(
            leading: Image.asset(categoryItem.image, height: 40),
            title: Text(categoryItem.title, style: Styles.styleMedium16),
          ),
        ),
      ),
    );
  }
}
