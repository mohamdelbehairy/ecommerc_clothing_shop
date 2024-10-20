import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CartPriceItem extends StatelessWidget {
  const CartPriceItem(
      {super.key, required this.title, required this.value, this.style});

  final String title, value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.styleMedium16WithOpacity),
        Text('\$$value', style: style ?? Styles.styleMedium16)
      ],
    );
  }
}
