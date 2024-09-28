import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'age_range_widget.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How Old are you ?', style: Styles.styleMedium16),
          const SizedBox(height: 16),
          const AgeRangeWidget(),
        ],
      ),
    );
  }
}
