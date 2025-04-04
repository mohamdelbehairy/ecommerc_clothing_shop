import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setSystemSetting() async {
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool(Constants.isDarkMode) ?? false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}
