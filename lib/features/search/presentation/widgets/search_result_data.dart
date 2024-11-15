import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/build_search/build_search_cubit.dart';
import 'function/search_result_get_list_data.dart';
import 'no_search_result_widget.dart';
import 'search_when_result_found.dart';

class SearchResultData extends StatelessWidget {
  const SearchResultData({super.key});

  @override
  Widget build(BuildContext context) {
    var search = context.read<BuildSearchCubit>();

    return BlocBuilder<BuildSearchCubit, BuildSearchState>(
      builder: (context, state) {
        searchResultGetListData(context);
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
