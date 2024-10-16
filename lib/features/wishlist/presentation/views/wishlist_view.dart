import 'package:flutter/material.dart';

import '../widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WishlistViewBody(),
    );
  }
}
