import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'select_type_to_buttons.dart';

class SelectTypeSection extends StatelessWidget {
  const SelectTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Who do you shop for ?', style: Styles.styleMedium16(context)),
          const SizedBox(height: 24),
          const SelectTypeToShopButtons(),
        ],
      ),
    );
  }
}
