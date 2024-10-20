import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import 'product_bottom_sheet_list_view_item.dart';

class ProductSizeBottomSheetListView extends StatelessWidget {
  const ProductSizeBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
            buildApp.sizeList.length,
            (index) => GestureDetector(
                  onTap: () {
                    buildApp.changeSizeBottomSheet(index);
                  },
                  child: ProductBottomSheetListViewItem(
                      isActive: buildApp.sizeIndex == index,
                      productSelectDetails: buildApp.sizeList[index]),
                )),
      ),
    );
  }
}
