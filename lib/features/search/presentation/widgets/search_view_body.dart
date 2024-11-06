import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_search/build_search_cubit.dart';
import 'no_search_result_widget.dart';
import 'search_view_header.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var isSearch = context.read<BuildSearchCubit>();

    return BlocBuilder<BuildSearchCubit, BuildSearchState>(
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 63),
              SearchViewHeader(),
              // if (!isSearch.isSearch) const SizedBox(height: 32),
              // if (!isSearch.isSearch) const CategoriesHeaderAndListViewSection()
              Flexible(child: NoSearchResultWidget()),
            ],
          ),
        );
      },
    );
  }
}

