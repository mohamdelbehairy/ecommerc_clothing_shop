import 'package:flutter/material.dart';

class PageViewModel {
  final PageController pageController;
  final Function(int)? onPageChanged;

  PageViewModel(
      {required this.pageController,
      required this.onPageChanged});
}
