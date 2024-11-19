import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/shared_pref_model.dart';
import 'shared_pref_repo.dart';

class SharedPrefRepoImpl extends SharedPrefRepo {
  @override
  Future<void> setString(SharedPrefModel sharedPrefModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPrefModel.key, sharedPrefModel.value);
  }

  @override
  Future<void> setBool(SharedPrefModel sharedPrefModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(sharedPrefModel.key, sharedPrefModel.value);
  }

  @override
  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<void> setList(List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(Constants.listUserData, value);
  }

  @override
  Future<List<String>?> getList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(Constants.listUserData);
  }
}
