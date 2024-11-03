import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/custom_multi_bloc_provider.dart';

class EClotShop extends StatelessWidget {
  const EClotShop({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //       statusBarColor: Colors.transparent,
    //       statusBarIconBrightness: Brightness.dark),
    // );
    return CustomMultiBlocProvider(
        child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: context.read<ChangeThemeCubit>().lightMode(),
          darkTheme: context.read<ChangeThemeCubit>().darkMode(),
          themeMode: context.read<ChangeThemeCubit>().isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    ));
  }
}
