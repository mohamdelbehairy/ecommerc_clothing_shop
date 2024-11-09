import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_products_grid_view.dart';
import '../../../home/presentation/manager/product/product_cubit.dart';
import '../manager/build_search/build_search_cubit.dart';
import 'no_search_result_widget.dart';

class SearchResultData extends StatelessWidget {
  const SearchResultData({super.key});

  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductCubit>();
    var search = context.watch<BuildSearchCubit>();

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        search.list = product.allProducts;
        search.searchList = search.searchController.text.isEmpty
            ? []
            : search.list
                .where((element) =>
                    (element.name.toLowerCase().contains(
                        search.searchController.text.toLowerCase())) ||
                    (element.category
                        .toLowerCase()
                        .contains(search.searchController.text.toLowerCase())))
                .toList();
        if (search.searchList.isNotEmpty) {
          return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${search.searchList.length} Results Found',
                    style: Styles.styleMedium12(context)),
                const SizedBox(height: 12),
                CustomProductsGridView(products: search.searchList),
              ],
            ),
          );
        }
        return const NoSearchResultWidget();
      },
    );
  }
}
