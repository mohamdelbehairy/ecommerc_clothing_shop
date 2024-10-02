import 'package:flutter/material.dart';

import '../../../../core/widgets/product_item_widget.dart';

class HomeTopSellingListView extends StatelessWidget {
  const HomeTopSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 281,
      // child: ListView.builder(
      //     itemCount: 10,
      //     scrollDirection: Axis.horizontal,
      //     physics: const BouncingScrollPhysics(),
      //     itemBuilder: (context, index) {
      //       return const Padding(
      //           padding: EdgeInsets.only(right: 12),
      //           child: ProductItemWidget());
      //     }),
    );
  }
}
