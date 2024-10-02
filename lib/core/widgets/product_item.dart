import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../models/background_model.dart';
import 'custom_background_container.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          height: 281,
          width: 159,
          padding: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesTest1, height: 220),
              const SizedBox(height: 4),
              Text('Men\'s Harrington Jacket', style: Styles.styleMedium12),
              const SizedBox(height: 8),
              Text(r'$148.00', style: Styles.styleBoldGarabito12)
            ],
          )),
    );
  }
}
