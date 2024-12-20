import 'package:dio/dio.dart';
import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/features/notification/data/repo/notification_repo_impl.dart';
import 'package:e_clot_shop/features/user_data/data/repo/user_data_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/email_auth/email_auth_repo_impl.dart';
import '../../features/auth/data/repo/social_auth/social_auth_repo_impl.dart';
import '../../features/home/data/repo/product_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SocialAuthRepoImpl>(SocialAuthRepoImpl());
  getIt.registerSingleton<EmailAuthRepoImpl>(EmailAuthRepoImpl());
  getIt.registerSingleton<UserDataRepoImpl>(UserDataRepoImpl());
  getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl());
  getIt.registerSingleton<NotificationRepoImpl>(NotificationRepoImpl());

  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // shared prefrence
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
}
