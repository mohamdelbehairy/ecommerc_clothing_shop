import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_widget.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackWidget(),
        const Spacer(flex: 3),
        Text('Cart', style: Styles.styleBold16),
        const Spacer(flex: 4),
      ],
    );
  }
}
