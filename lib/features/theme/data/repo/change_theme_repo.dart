import 'package:flutter/material.dart';

abstract class ChangeThemeRepo {
  Future<void> saveDarkMode(bool isDark);
  Future<bool> getDarkMode();
  ThemeData lightMode();
  ThemeData darkMode();
}
