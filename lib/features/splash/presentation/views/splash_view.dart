import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Image.asset(Assets.imagesLogo, height: 300))),
    );
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).go(AppRouter.onBoardring);
    });
  }
}