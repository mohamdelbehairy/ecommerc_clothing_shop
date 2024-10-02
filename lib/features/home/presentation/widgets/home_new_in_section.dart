import 'package:flutter/material.dart';

import 'home_new_in_header.dart';
import 'home_top_selling_list_view.dart';

class HomeNewInSection extends StatelessWidget {
  const HomeNewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeNewInHeader(),
        SizedBox(height: 16),
        HomeTopSellingListView()
      ],
    );
  }
}
