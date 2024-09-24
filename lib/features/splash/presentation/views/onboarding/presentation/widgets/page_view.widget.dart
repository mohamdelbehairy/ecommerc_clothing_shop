import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../data/on_boardring_model.dart';
import '../../data/page_view_model.dart';
import 'on_boardring_item.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key, required this.pageViewModel});
  final PageViewModel pageViewModel;

  @override
  Widget build(BuildContext context) {
       List items = [
      OnBoardringModel(
          image: Assets.imagesOne,
          header: 'Shop From your favorite store',
          body:
              'Discover a world of convenience and endless choices  Get ready to experience the best of online shopping right at your fingertips.'),
      OnBoardringModel(
          image: Assets.imagesTwo,
          header: 'Get IT Delivered',
          body:
              'Enjoy fast and reliable delivery right to your door. No more waiting in long lines—your favorites come to you!'),
      OnBoardringModel(
          image: Assets.imagesThree,
          header: 'Flexible payment',
          body:
              'Choose the payment method that suits you best. Enjoy secure transactions and a hassle-free checkout experience.'),
    ];
    return Container(
      margin: const EdgeInsets.only(top: 812 - 650),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
      child: PageView(
        controller: pageViewModel.pageController,
        onPageChanged: pageViewModel.onPageChanged,
        children: List.generate(
            3,
            (index) =>
                OnBoardringItem(onBoardringModel: items[index])),
      ),
    );
  }
}
