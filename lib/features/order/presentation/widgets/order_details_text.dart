
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class OrderDetailsText extends StatelessWidget {
  const OrderDetailsText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.styleBold16(context));
  }
}