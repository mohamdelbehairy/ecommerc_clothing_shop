import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/on_boardring_button_model.dart';
import '../../data/page_view_model.dart';
import '../widgets/on_boardring_button_bottom.dart';
import '../widgets/on_boardring_button_top.dart';
import '../widgets/on_boardring_smooth_indicator.dart';
import '../widgets/page_view.widget.dart';

class OnBoardringView extends StatefulWidget {
  const OnBoardringView({super.key});

  @override
  State<OnBoardringView> createState() => _OnBoardringViewState();
}

class _OnBoardringViewState extends State<OnBoardringView> {
  late PageController _pageController;
  bool isLastPage = false;
  int index = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          PageViewWidget(
              pageViewModel: PageViewModel(
                  pageController: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                      this.index = index;
                    });
                  })),
          Positioned(
              left: 20,
              bottom: 30,
              child: OnBoardringSmoothIndicator(
                  pageController: _pageController,
                  onDotClicked: (index) {
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  })),
          Positioned(
              // right: -35,
              // bottom: -35,
              right: 20,
              bottom: 15,
              child: OnBoardringButtonBottom(
                isLastPage: isLastPage,
                onTap: () {
                  if (isLastPage) {
                    GoRouter.of(context).go(AppRouter.login);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                },
              )),
          if (index == 0)
            Positioned(
                right: 16,
                top: 812 - 690,
                child: OnBoardringButtonTop(
                  onBoardringButtonModel: OnBoardringButtonModel(
                      text: 'skip',
                      onTap: () => GoRouter.of(context).go(AppRouter.login)),
                )),
          if (index != 0)
            Positioned(
                left: 16,
                top: 812 - 730,
                child: OnBoardringButtonTop(
                  onBoardringButtonModel: OnBoardringButtonModel(
                      text: 'Previous',
                      onTap: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }),
                ))
        ],
      ),
    );
  }
}
