import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/shared_pref/data/repo/shared_pref_repo.dart';

import '../../../shared_pref/data/models/shared_pref_model.dart';
import '../../../shared_pref/data/repo/shared_pref_repo_impl.dart';
import 'change_theme_repo.dart';

class ChangeThemeRepoImpl extends ChangeThemeRepo {
  final SharedPrefRepo _sharedPrefRepo = SharedPrefRepoImpl();
  @override
  Future<void> saveDarkMode(bool isDark) async {
    await _sharedPrefRepo
        .setBool(SharedPrefModel(key: Constants.isDarkMode, value: isDark));
  }

  @override
  Future<bool> getDarkMode() async {
    return await _sharedPrefRepo.getBool(Constants.isDarkMode);
  }
}
