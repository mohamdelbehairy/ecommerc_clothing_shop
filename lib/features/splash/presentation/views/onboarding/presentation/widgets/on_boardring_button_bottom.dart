import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardringButtonBottom extends StatelessWidget {
  const OnBoardringButtonBottom(
      {super.key, required this.isLastPage, required this.onTap});

  final bool isLastPage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        // radius: 180 / 2,
        radius: 30,
        backgroundColor: AppColors.primaryColor,
        child: Transform.rotate(
            angle: isLastPage ? 0 : 180 * 3.14 / 180,
            child: Icon(isLastPage ? Icons.done : Icons.arrow_back,
                // size: 55,
                size: 30,
                color: Colors.white)),
      ),
    );
  }
}
