import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/shared_pref/data/models/shared_pref_model.dart';
import '../../features/shared_pref/data/repo/shared_pref_repo.dart';
import '../../features/shared_pref/data/repo/shared_pref_repo_impl.dart';

class CachedAndRemoveUserId {
  static final SharedPrefRepo _sharedPrefRepo = SharedPrefRepoImpl();
  static Future<void> cachedLoginUserID() async {
    await _firstLogin();
    await _userData(FirebaseAuth.instance.currentUser!.uid);
  }

  static Future<void> cachedRegisterUserID(String userName, String type) async {
    await _firstLogin();
    await _sharedPrefRepo
        .setBool(SharedPrefModel(key: Constants.registerDone, value: true));
    await _sharedPrefRepo.setList([
      FirebaseAuth.instance.currentUser!.uid,
      FirebaseAuth.instance.currentUser!.email != null
          ? FirebaseAuth.instance.currentUser!.email!
          : FirebaseAuth.instance.currentUser!.phoneNumber!,
      userName,
      FirebaseAuth.instance.currentUser!.photoURL != null
          ? FirebaseAuth.instance.currentUser!.photoURL!
          : Constants.defaultUserImageUrl,
      type
    ]);
  }

  static Future<void> removeRegisterUserID() async {
    await _sharedPrefRepo.remove(Constants.registerDone);
    await _sharedPrefRepo.remove(Constants.listUserData);
    await _userData(FirebaseAuth.instance.currentUser!.uid);
  }

  static Future<void> removeUserID() async {
    await _sharedPrefRepo.remove(Constants.userId);
  }

  static Future<void> _userData(dynamic value) async {
    await _sharedPrefRepo
        .setString(SharedPrefModel(key: Constants.userId, value: value));
  }

  static Future<void> _firstLogin() async {
    await _sharedPrefRepo
        .setBool(SharedPrefModel(key: Constants.firstLogin, value: true));
  }
}
