import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/features/shared_pref/data/repo/shared_pref_repo_impl.dart';
import 'package:e_clot_shop/features/shared_pref/presentation/manager/shared_pref/shared_pref_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/presentation/manager/build_login/build_login_cubit.dart';

class EClotShop extends StatelessWidget {
  const EClotShop({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BuildLoginCubit()),
        BlocProvider(
            create: (context) => SharedPrefCubit(SharedPrefRepoImpl())),
      ],
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
