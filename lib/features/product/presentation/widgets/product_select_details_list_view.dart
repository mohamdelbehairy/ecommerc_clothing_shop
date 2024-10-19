import 'package:flutter/material.dart';

import '../../data/models/product_select_details_model.dart';
import 'product_select_details_widget.dart';

class ProductSelectDetailsListView extends StatelessWidget {
  const ProductSelectDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ProductSelectDetailsWidget(
              productSelectDetailsModel:
                  ProductSelectDetailsModel(title: 'Size')),
          const SizedBox(height: 12),
          ProductSelectDetailsWidget(
              productSelectDetailsModel:
                  ProductSelectDetailsModel(title: 'Color')),
          const SizedBox(height: 12),
          ProductSelectDetailsWidget(
              productSelectDetailsModel:
                  ProductSelectDetailsModel(title: 'Quantity')),
        ],
      ),
    );
  }
}