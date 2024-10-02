import 'package:flutter/material.dart';
import 'home_top_selling_header.dart';
import 'home_top_selling_list_view.dart';

class HomeTopSellingSection extends StatelessWidget {
  const HomeTopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTopSellingHeader(),
        SizedBox(height: 16),
        HomeTopSellingListView()
      ],
    );
  }
}
