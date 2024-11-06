import 'package:flutter/material.dart';

import 'search_view_header.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 63),
          SearchViewHeader(),
        ],
      ),
    );
  }
}

