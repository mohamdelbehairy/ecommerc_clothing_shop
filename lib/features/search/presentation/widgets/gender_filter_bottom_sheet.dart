import 'package:flutter/material.dart';

import 'gender_filter_bottom_sheet_header.dart';
import 'gender_filter_bottom_sheet_list_view.dart';

class GenderFilterBottomSheet extends StatelessWidget {
  const GenderFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GenderFilterBottomSheetHeader(),
          SizedBox(height: 12),
          GenderFilterBottomSheetListView(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}




