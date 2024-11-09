import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import 'category_filter_bottom_sheet_list_view.dart';

class CategoryFilterBottomSheet extends StatelessWidget {
  const CategoryFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBottomSheetheader(
              text: 'Price',
              clear: 'Clear',
              onTap: () {
                if (buildApp.searchCategoryIndex != -1) {
                  buildApp.clearCategoryBottomSheet();
                }
              }),
          const SizedBox(height: 12),
          const CategoryFilterBottomSheetListView(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
