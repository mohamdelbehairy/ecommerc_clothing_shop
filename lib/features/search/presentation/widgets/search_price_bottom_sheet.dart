import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import 'search_price_bottom_sheet_list_view.dart';

class SearchPriceBottomSheet extends StatelessWidget {
  const SearchPriceBottomSheet({super.key});

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
                if (buildApp.priceIndex != -1) {
                  buildApp.clearPriceBottomSheet();
                }
              }),
          const SizedBox(height: 12),
          const SearchPriceBottomSheetListView(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
