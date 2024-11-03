import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NoProccessingorShippedOrDeliverdWidget extends StatelessWidget {
  const NoProccessingorShippedOrDeliverdWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesNoOrders),
        const SizedBox(height: 24),
        Text('No $text Yet', style: Styles.styleMedium24(context)),
      ],
    );
  }
}