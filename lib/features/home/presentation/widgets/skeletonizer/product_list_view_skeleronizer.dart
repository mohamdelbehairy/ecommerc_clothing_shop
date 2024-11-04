import 'package:flutter/material.dart';

import 'product_item_skeleronizer.dart';

class ProductListViewSkeleronizer extends StatelessWidget {
  const ProductListViewSkeleronizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(right: 12, left: index == 0 ? 24 : 0),
                child: const ProductItemSkeleronizer());
          }),
    );
  }
}
