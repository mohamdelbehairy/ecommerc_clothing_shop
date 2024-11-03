import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: Text('See All', style: Styles.styleMedium16(context)));
  }
}
