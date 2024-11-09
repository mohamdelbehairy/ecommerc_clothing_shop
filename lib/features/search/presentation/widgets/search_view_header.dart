import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_widget.dart';
import 'search_text_field.dart';

class SearchViewHeader extends StatelessWidget {
  const SearchViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
       padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CustomBackWidget(),
          SizedBox(width: 8),
          Expanded(child: SearchTextField()),
        ],
      ),
    );
  }
}
