import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_search/build_search_cubit.dart';
import 'filter_item.dart';
import 'search_filter_widget.dart';

class SearchFilterListView extends StatelessWidget {
  const SearchFilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    var search = context.watch<BuildSearchCubit>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const FilterItem(),
          const SizedBox(width: 6),
          ...search.searchHeader.map((e) => Padding(
              padding: const EdgeInsets.only(right: 6),
              child: SearchFilterWidget(searchFilterModel: e)))
        ],
      ),
    );
  }
}
