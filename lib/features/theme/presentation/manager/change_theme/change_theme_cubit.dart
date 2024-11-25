// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../data/repo/change_theme_repo.dart';

// part 'change_theme_state.dart';

// class ChangeThemeCubit extends Cubit<ChangeThemeState> {
//   ChangeThemeCubit(this._changeThemeRepo) : super(ChangeThemeInitial()) {
//     getDarkMode().then((value) {
//       isDarkMode = value;
//       emit(AppThemeChanged());
//     });
//   }

//   final ChangeThemeRepo _changeThemeRepo;

//   bool isDarkMode = false;

//   Future<void> saveDarkMode({required bool isDarkMode}) async {
//     try {
//       await _changeThemeRepo.saveDarkMode(isDarkMode);
//     } catch (e) {
//       emit(ChangeThemeFailure(errorMessage: e.toString()));
//       log('error from save dark mode: $e');
//     }
//   }

//   Future<bool> getDarkMode() async {
//     return await _changeThemeRepo.getDarkMode();
//   }

//   void changeDarkMode(bool darkMode) async {
//     isDarkMode = darkMode;
//     await saveDarkMode(isDarkMode: isDarkMode);
//     emit(AppThemeChanged());
//   }

//   int themeIndex = 0;

//   List<String> themeList = ['Light Mode', 'Dark Mode'];

//   void changeThemeIndex(int index) {
//     if (themeIndex == index) return;
//     themeIndex = index;

//     emit(ChangeThemeIndex());
//   }

//   ThemeData lightMode() {
//   return  _changeThemeRepo.lightMode();
//   }

//   ThemeData darkMode() {
//    return _changeThemeRepo.darkMode();
//   }
// }
