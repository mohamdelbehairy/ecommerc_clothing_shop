import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.styleBold32(context));
  }
}
