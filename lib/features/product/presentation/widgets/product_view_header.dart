import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/background_circle_avatar.dart';
import '../../../../core/widgets/custom_back_widget.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackWidget(),
          BackgroundCircleAvatar(height: 22, image: Assets.imagesFav)
        ],
      ),
    );
  }
}
