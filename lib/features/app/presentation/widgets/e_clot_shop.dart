import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_multi_bloc_provider.dart';

class EClotShop extends StatelessWidget {
  const EClotShop({super.key, required this.scaffoldMessengerKey});
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
        child: BlocBuilder<BuildAppCubit, BuildAppState>(
      builder: (context, state) {
        final isDarkMode = context.read<BuildAppCubit>();
        return MaterialApp.router(
            title: "E-Clothing Shop",
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: isDarkMode.lightMode(),
            darkTheme: isDarkMode.darkMode(),
            themeMode: isDarkMode.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router);
      },
    ));
  }
}
