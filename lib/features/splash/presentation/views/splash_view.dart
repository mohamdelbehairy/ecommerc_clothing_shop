import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';

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
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      // body: Center(
      //     child: Padding(
      //         padding: const EdgeInsets.only(top: 32),
      //         child: Image.asset(Assets.imagesLogo, height: 300))),
    );
  }

  void navigation() {
    var sharedPref = context.read<BuildAppCubit>();
    Future.delayed(const Duration(seconds: 1), () async {
      if (await sharedPref.getBool(key: Constants.firstLogin)) {
        if (await sharedPref.getBool(key: Constants.registerDone)) {
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.tellAbout);
        } else if (await sharedPref.getString(key: Constants.userId) != null) {
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.bottomNavigationBar);
        } else {
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.login);
        }
      } else {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRouter.onBoardring);
      }
    });
  }
}
