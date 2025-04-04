import '../models/shared_pref_model.dart';

abstract class SharedPrefRepo {
  Future<void> setString(SharedPrefModel sharedPrefModel);
  Future<void> setBool(SharedPrefModel sharedPrefModel);
  bool getBool(String key);
  Future<String?> getString(String key);
  Future<void> remove(String key);
  Future<void> setList(List<String> value);
  Future<List<String>?> getList();
}
