import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../manager/build_search/build_search_cubit.dart';
import 'no_search_result_widget.dart';
import 'search_when_result_found.dart';

class SearchResultData extends StatelessWidget {
  const SearchResultData({super.key});

  @override
  Widget build(BuildContext context) {
    var search = context.read<BuildSearchCubit>();
    var buildApp = context.watch<BuildAppCubit>();

    return BlocBuilder<BuildSearchCubit, BuildSearchState>(
      builder: (context, state) {
        // if (buildApp.priceIndex == 0) {
        //   search.list = search.minPrice;
        // } else if (buildApp.priceIndex == 1) {
        //   search.list = search.maxPrice;
        // } else {
        //   search.list = search.allProducts;
        // }

        if (buildApp.sortbyIndex == 1) {
          search.list = search.newest;
        } else if (buildApp.sortbyIndex == 2) {
          search.list = search.oldest;
        } else {
          search.list = search.allProducts;
        }

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
          return SearchWhenResultFound(searchList: search.searchList);
        }
        return const NoSearchResultWidget();
      },
    );
  }
}
