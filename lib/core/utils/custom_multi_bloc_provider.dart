import 'package:e_clot_shop/features/notification/data/repo/notification_repo_impl.dart';
import 'package:e_clot_shop/features/notification/presentation/manager/notification/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repo/product_repo_impl.dart';
import '../../features/home/presentation/manager/product/product_cubit.dart';
import '../../features/order/data/repos/order_repo_impl.dart';
import '../../features/order/presentation/manager/order/order_cubit.dart';
import '../../features/shared_pref/data/repo/shared_pref_repo_impl.dart';
import '../../features/shared_pref/presentation/manager/shared_pref/shared_pref_cubit.dart';
import '../../features/theme/data/repo/change_theme_repo_impl.dart';
import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../features/update/data/repo/update_data_repo_impl.dart';
import '../../features/update/presentation/manager/update_data/update_data_cubit.dart';
import '../../features/user_data/data/repo/user_data_repo_impl.dart';
import '../../features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import '../../features/wishlist/data/repo/wishlist_repo_impl.dart';
import '../../features/wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import '../manager/build_app/build_app_cubit.dart';
import 'setup_service_locator.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => BuildAppCubit()),
      BlocProvider(create: (context) => SharedPrefCubit(SharedPrefRepoImpl())),
      BlocProvider(
          create: (context) => GetUserDataCubit(getIt.get<UserDataRepoImpl>())),
      BlocProvider(
          create: (context) => ProductCubit(getIt.get<ProductRepoImpl>())),
      BlocProvider(create: (context) => WishlistCubit(WishlistRepoImpl())),
      BlocProvider(create: (context) => OrderCubit(OrderRepoImpl())),
      BlocProvider(create: (context) => UpdateDataCubit(UpdateDataRepoImpl())),
      BlocProvider(
          create: (context) => ChangeThemeCubit(ChangeThemeRepoImpl())),
      BlocProvider(
          create: (context) => NotificationCubit(NotificationRepoImpl()))
    ], child: child);
  }
}
