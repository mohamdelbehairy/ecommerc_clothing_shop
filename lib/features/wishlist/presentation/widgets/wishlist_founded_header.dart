import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_back_widget.dart';

class WishlistFoundedHeader extends StatelessWidget {
  const WishlistFoundedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackWidget(),
        const Spacer(flex: 2),
        Text('Cart', style: Styles.styleBold16),
        const Spacer(flex: 3),
      ],
    );
  }
}
