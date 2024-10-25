import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'order_placed_successfully_widget.dart';

class OrderPlacedSuccessViewBody extends StatelessWidget {
  const OrderPlacedSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(child: SizedBox()),
      Expanded(flex: 3, child: Image.asset(Assets.imagesOrderPlaced)),
      const Expanded(flex: 3, child: OrderPlacedSuccessfullyWidget()),
    ]);
  }
}
