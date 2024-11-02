abstract class ChangeThemeRepo {
  Future<void> saveDarkMode(bool isDark);
  Future<bool> getDarkMode();
}
