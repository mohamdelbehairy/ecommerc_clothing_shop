import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/explore_categories_button.dart';

class NoNotificationYetWidget extends StatelessWidget {
  const NoNotificationYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(Assets.imagesNotify),
          const SizedBox(height: 24),
          Text('No Notification yet', style: Styles.styleMedium24),
          const SizedBox(height: 24),
          const ExploreCategoriesButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
