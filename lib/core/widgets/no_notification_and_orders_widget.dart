import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'explore_categories_button.dart';

class NoNotificationAndOrdersWidget extends StatelessWidget {
  const NoNotificationAndOrdersWidget({super.key, required this.text, required this.image});
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(image),
          const SizedBox(height: 24),
          Text(text, style: Styles.styleMedium24),
          const SizedBox(height: 24),
          const ExploreCategoriesButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
