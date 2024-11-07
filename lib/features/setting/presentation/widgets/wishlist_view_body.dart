import 'package:flutter/material.dart';

import '../../../../core/widgets/back_and_text_header.dart';
import '../../../../core/widgets/background_list_tiled.dart';

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
          BackgroundListTile(child: SizedBox())
        ],
      ),
    );
  }
}

