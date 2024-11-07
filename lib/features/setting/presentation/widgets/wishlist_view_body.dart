import 'package:flutter/material.dart';

import '../../../../core/widgets/back_and_text_header.dart';
import 'wishlist_view_list_view.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 63),
          BackAndTextHeader(text: 'Wishlist'),
          SizedBox(height: 32),
          WishlistViewListView(),
        ],
      ),
    );
  }
}

