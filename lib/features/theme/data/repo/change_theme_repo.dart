import 'package:flutter/material.dart';

abstract class ChangeThemeRepo {
  Future<void> saveDarkMode(bool isDark);
  bool getDarkMode();
  ThemeData lightMode();
  ThemeData darkMode();
}
