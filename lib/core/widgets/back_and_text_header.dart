import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_back_widget.dart';

class BackAndTextHeader extends StatelessWidget {
  const BackAndTextHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackWidget(),
        const Spacer(flex: 3),
        Text(text, style: Styles.styleBold16),
        const Spacer(flex: 4),
      ],
    );
  }
}
