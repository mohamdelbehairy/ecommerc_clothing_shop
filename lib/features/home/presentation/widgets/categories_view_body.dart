import 'package:e_clot_shop/core/widgets/custom_back_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/categories_header_and_list_view_section.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63),
          CustomBackWidget(),
          SizedBox(height: 16),
          CategoriesHeaderAndListViewSection(),
        ],
      ),
    );
  }
}


