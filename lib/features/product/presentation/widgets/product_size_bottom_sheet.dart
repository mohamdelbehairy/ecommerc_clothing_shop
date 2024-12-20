import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_bottom_sheet_header.dart';
import 'product_size_bottom_sheet_list_view.dart';

class ProductSizeBottomSheet extends StatelessWidget {
  const ProductSizeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBottomSheetheader(text: 'Size'),
          SizedBox(height: 8),
          ProductSizeBottomSheetListView(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
