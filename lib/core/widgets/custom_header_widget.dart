import 'package:flutter/material.dart';

import 'custom_back_widget.dart';
import 'custom_header_text.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackWidget(),
          const SizedBox(height: 24),
          CustomHeaderText(text: text),
        ],
      ),
    );
  }
}
