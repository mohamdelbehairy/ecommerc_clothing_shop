import 'package:flutter/material.dart';

import '../home_new_in_header.dart';
import '../home_top_selling_header.dart';
import 'product_list_view_skeleronizer.dart';

class HomeTopSellingSkeleronizer extends StatelessWidget {
  const HomeTopSellingSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeTopSellingHeader()),
        SizedBox(height: 16),
        ProductListViewSkeleronizer()
      ],
    );
  }
}

class HomeNewInSkeleronizer extends StatelessWidget {
  const HomeNewInSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeNewInHeader()),
        SizedBox(height: 16),
        ProductListViewSkeleronizer()
      ],
    );
  }
}
