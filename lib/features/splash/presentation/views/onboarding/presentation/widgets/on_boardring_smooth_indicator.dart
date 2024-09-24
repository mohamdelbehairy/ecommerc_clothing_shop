import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardringSmoothIndicator extends StatelessWidget {
  const OnBoardringSmoothIndicator(
      {super.key, required this.pageController, this.onDotClicked});
  final PageController pageController;
  final Function(int)? onDotClicked;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: const Color(0xff585186).withOpacity(.5),
            activeDotColor: AppColors.primaryColor),
        onDotClicked: onDotClicked);
  }
}
