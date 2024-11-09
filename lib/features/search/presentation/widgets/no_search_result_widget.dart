import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/explore_categories_button.dart';

class NoSearchResultWidget extends StatelessWidget {
  const NoSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(Assets.imagesNoSearch),
          const SizedBox(height: 24),
          Text('Sorry, we couldn\'t find any matching result for your\n Search.',
              textAlign: TextAlign.center, style: Styles.styleMedium24(context)),
          const SizedBox(height: 24),
          const ExploreCategoriesButton(),
          const Spacer(),
        ],
      ),
    );
  }
}