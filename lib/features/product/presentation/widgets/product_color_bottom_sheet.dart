import 'package:flutter/material.dart';

import 'product_bottom_sheet_header.dart';
import 'product_color_bottom_sheet_list_view.dart';

class ProductColorBottomSheet extends StatelessWidget {
  const ProductColorBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductBottomSheetheader(text: 'Color'),
          SizedBox(height: 8),
          ProductColorBottomSheetListView(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
