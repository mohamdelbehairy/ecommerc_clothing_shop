import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';
import '../../../product/data/models/product_select_details_model.dart';

class GenderFilterBottomSheetListView extends StatelessWidget {
  const GenderFilterBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Column(
      children: List.generate(
          buildApp.gender.length,
          (index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                buildApp.genderActiveIndex(index);
              },
              child: BottomSheetListViewItem(
                isActive: buildApp.genderIndex == index,
                productSelectDetails:
                    ProductSelectDetailsModel(title: buildApp.gender[index]),
              ))),
    );
  }
}