import 'package:flutter/material.dart';

import '../widgets/wishlist_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WishListViewBody(),
    );
  }
}


