import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_widget.dart';
import 'cart_empty_widget.dart';

class NoFavouriteFounded extends StatelessWidget {
  const NoFavouriteFounded({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63),
          CustomBackWidget(),
          CartEmptyWidget(),
        ],
      ),
    );
  }
}
