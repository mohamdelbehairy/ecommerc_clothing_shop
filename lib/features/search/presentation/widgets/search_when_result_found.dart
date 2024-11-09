import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_products_grid_view.dart';
import '../../../home/data/models/product_model.dart';

class SearchWhenResultFound extends StatelessWidget {
  const SearchWhenResultFound({super.key, required this.searchList});

  final List<ProductModel> searchList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${searchList.length} Results Found',
              style: Styles.styleMedium12(context)),
          const SizedBox(height: 12),
          CustomProductsGridView(products: searchList),
        ],
      ),
    );
  }
}