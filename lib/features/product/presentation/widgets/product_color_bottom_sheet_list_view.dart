import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';

class ProductColorBottomSheetListView extends StatelessWidget {
  const ProductColorBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
            buildApp.colorList.length,
            (index) => GestureDetector(
                  onTap: () {
                    buildApp.changeColorBottomSheet(index);
                  },
                  child: BottomSheetListViewItem(
                      isActive: buildApp.colorIndex == index,
                      productSelectDetails: buildApp.colorList[index]),
                )),
      ),
    );
  }
}
