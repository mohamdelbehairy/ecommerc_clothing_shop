import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'select_type_to_buttons.dart';

class TellAboutViewBody extends StatelessWidget {
  const TellAboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text('Tell us About yourself', style: Styles.styleBold24),
          const SizedBox(height: 30),
          Text('Who do you shop for ?', style: Styles.styleMedium16),
          const SizedBox(height: 24),
          const SelectTypeToShopButtons(),
          const SizedBox(height: 80),
          Text('How Old are you ?', style: Styles.styleMedium16),
        ],
      ),
    );
  }
}
