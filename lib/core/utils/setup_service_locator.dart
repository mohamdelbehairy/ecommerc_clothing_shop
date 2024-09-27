import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/email_auth/email_auth_repo_impl.dart';
import '../../features/auth/data/repo/social_auth/social_auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SocialAuthRepoImpl>(SocialAuthRepoImpl());
  getIt.registerSingleton<EmailAuthRepoImpl>(EmailAuthRepoImpl());
}
