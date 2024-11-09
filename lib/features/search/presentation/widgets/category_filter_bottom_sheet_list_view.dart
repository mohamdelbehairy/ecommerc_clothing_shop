import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';
import '../../../product/data/models/product_select_details_model.dart';

class CategoryFilterBottomSheetListView extends StatelessWidget {
  const CategoryFilterBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: List.generate(
          buildApp.categories.length,
          (index) => GestureDetector(
                onTap: () => buildApp.searchCategoryActiveIndex(index),
                child: BottomSheetListViewItem(
                    isActive: buildApp.searchCategoryIndex == index,
                    productSelectDetails: ProductSelectDetailsModel(
                        title: buildApp.categories[index].title)),
              )),
    );
  }
}
