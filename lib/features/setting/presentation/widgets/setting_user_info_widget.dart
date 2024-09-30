import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SettingUserInfoWidget extends StatelessWidget {
  const SettingUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        Text('Gilbert Jones', style: Styles.styleBold16),
        const SizedBox(height: 6),
        Text('Glbertjones001@gmail.com',
            style: Styles.styleMedium16WithOpacity),
        const SizedBox(height: 6),
        Text('121-224-7890', style: Styles.styleMedium16WithOpacity),
        const SizedBox(height: 13),
      ],
    );
  }
}