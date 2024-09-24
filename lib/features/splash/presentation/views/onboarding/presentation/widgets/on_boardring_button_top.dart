import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../data/on_boardring_button_model.dart';

class OnBoardringButtonTop extends StatelessWidget {
  const OnBoardringButtonTop({super.key, required this.onBoardringButtonModel});

  final OnBoardringButtonModel onBoardringButtonModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBoardringButtonModel.onTap,
      child:
          Text(onBoardringButtonModel.text, style: Styles.styleSemiBoldWhite20),
    );
  }
}
