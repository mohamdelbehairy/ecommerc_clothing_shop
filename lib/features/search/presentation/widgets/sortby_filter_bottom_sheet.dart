import 'package:flutter/material.dart';

import 'sortby_filter_bottom_sheet_header.dart';
import 'sortby_filter_bottom_sheet_list_view.dart';

class SortbyFilterBottomSheet extends StatelessWidget {
  const SortbyFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SortbyFilterBottomSheetHeader(),
          SizedBox(height: 12),
          SortbyFilterBottomSheetListView(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

