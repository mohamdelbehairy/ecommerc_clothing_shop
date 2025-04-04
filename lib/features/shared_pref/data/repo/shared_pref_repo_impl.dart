import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/shared_pref_model.dart';
import 'shared_pref_repo.dart';

class SharedPrefRepoImpl extends SharedPrefRepo {
  @override
  Future<void> setString(SharedPrefModel sharedPrefModel) async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.setString(sharedPrefModel.key, sharedPrefModel.value);
  }

  @override
  Future<void> setBool(SharedPrefModel sharedPrefModel) async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.setBool(sharedPrefModel.key, sharedPrefModel.value);
  }

  @override
  bool getBool(String key) {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<String?> getString(String key) async {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.remove(key);
  }

  @override
  Future<void> setList(List<String> value) async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.setStringList(Constants.listUserData, value);
  }

  @override
  Future<List<String>?> getList() async {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getStringList(Constants.listUserData);
  }
}
