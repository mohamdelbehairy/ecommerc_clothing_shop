import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/categories_header_and_list_view_section.dart';
import '../manager/build_search/build_search_cubit.dart';
import 'search_filter_list_view.dart';
import 'search_result_data.dart';
import 'search_view_header.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isSearch = context.read<BuildSearchCubit>();

    return BlocBuilder<BuildSearchCubit, BuildSearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 63),
            const SearchViewHeader(),
            if (isSearch.isSearch) const SizedBox(height: 24),
            if (isSearch.isSearch) const SearchFilterListView(),
            if (isSearch.isSearch) const SizedBox(height: 16),
            if (isSearch.isSearch) const Flexible(child: SearchResultData()),
            if (!isSearch.isSearch) const SizedBox(height: 32),
            if (!isSearch.isSearch) const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CategoriesHeaderAndListViewSection())
          ],
        );
      },
    );
  }
}
