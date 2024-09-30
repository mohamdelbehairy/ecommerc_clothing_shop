import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/shared_pref/data/models/shared_pref_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/shared_pref/data/repo/shared_pref_repo.dart';
import '../../features/shared_pref/data/repo/shared_pref_repo_impl.dart';

Future<void> cachedUserIdAndFirstLogin(UserCredential credential) async {
  final SharedPrefRepo sharedPrefRepo = SharedPrefRepoImpl();
  await sharedPrefRepo
      .setBool(SharedPrefModel(key: Constants.firstLogin, value: true));
  await sharedPrefRepo.setString(
      SharedPrefModel(key: Constants.userId, value: credential.user!.uid));
}
