import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/repo/product_repo_impl.dart';
import '../../../home/presentation/manager/product/product_cubit.dart';
import '../../../notification/data/repo/notification_repo_impl.dart';
import '../../../notification/presentation/manager/notification/notification_cubit.dart';
import '../../../order/data/repos/order_repo_impl.dart';
import '../../../order/presentation/manager/build_order/build_order_cubit.dart';
import '../../../shared_pref/data/repo/shared_pref_repo_impl.dart';
import '../../../theme/data/repo/change_theme_repo_impl.dart';
import '../../../update/data/repo/update_data_repo_impl.dart';
import '../../../update/presentation/manager/update_data/update_data_cubit.dart';
import '../../../user_data/data/repo/user_data_repo_impl.dart';
import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import '../../../wishlist/data/repo/wishlist_repo_impl.dart';
import '../../../wishlist/presentation/manager/wishlist/wishlist_cubit.dart';
import '../manager/build_app/build_app_cubit.dart';
import '../../../../core/utils/setup_service_locator.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              BuildAppCubit(SharedPrefRepoImpl(), ChangeThemeRepoImpl())),
      BlocProvider(
          create: (context) => GetUserDataCubit(getIt.get<UserDataRepoImpl>())),
      BlocProvider(create: (context) => UpdateDataCubit(UpdateDataRepoImpl())),
      BlocProvider(
          create: (context) => ProductCubit(getIt.get<ProductRepoImpl>())),
      BlocProvider(create: (context) => WishlistCubit(WishlistRepoImpl())),
      BlocProvider(
          create: (context) => BuildOrderCubit(OrderRepoImpl(),
              getIt.get<NotificationRepoImpl>(), UpdateDataRepoImpl())),
      BlocProvider(
          create: (context) =>
              NotificationCubit(getIt.get<NotificationRepoImpl>()))
    ], child: child);
  }
}
