import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../utils/custom_multi_bloc_provider.dart';

class EClotShop extends StatelessWidget {
  const EClotShop({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return CustomMultiBlocProvider(
        child: MaterialApp.router(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    ));
  }
}

