import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';
import '../../../product/data/models/product_select_details_model.dart';

class SortbyFilterBottomSheetListView extends StatelessWidget {
  const SortbyFilterBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: List.generate(
          3,
          (index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                buildApp.sortbyActiveIndex(index);
              },
              child: BottomSheetListViewItem(
                isActive: buildApp.sortbyIndex == index,
                productSelectDetails: ProductSelectDetailsModel(
                    title: buildApp.sortbyList[index]),
              ))),
    );
  }
}