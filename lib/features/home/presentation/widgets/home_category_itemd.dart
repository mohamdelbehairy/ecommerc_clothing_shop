import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesHoodies),
        const SizedBox(height: 4),
        Text('Hoodies', style: Styles.styleMedium14),
      ],
    );
  }
}
