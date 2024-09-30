import '../models/shared_pref_model.dart';

abstract class SharedPrefRepo {
  Future<void> setString(SharedPrefModel sharedPrefModel);
  Future<void> setBool(SharedPrefModel sharedPrefModel);
  Future<bool> getBool(String key);
}
