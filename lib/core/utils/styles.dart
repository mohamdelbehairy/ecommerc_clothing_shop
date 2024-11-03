import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';

class Styles {
  static TextStyle styleBold32(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 32);
  }

  static TextStyle styleBoldNunito24(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 24);
  }

  static TextStyle styleBold20(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 20);
  }

  static TextStyle styleMedium16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 16);
  }

  static TextStyle styleMedium16WithOpacity(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? Colors.white.withOpacity(.5)
            : const Color(0xff272727).withOpacity(.5),
        fontSize: 16);
  }

  static TextStyle styleMediumWhite16 = GoogleFonts.nunito(
      fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16);

  static TextStyle styleSemiBoldWhite20 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20);

  static TextStyle styleBoldNunito12 = GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      color: const Color(0xff272727),
      fontSize: 12);

  static TextStyle styleMedium12(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 12);
  }

  static TextStyle styleMediumWithOpacity12(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? Colors.white.withOpacity(.5)
            : const Color(0xff272727).withOpacity(.5),
        fontSize: 12);
  }

  static TextStyle styleMedium14 = GoogleFonts.nunito(
      fontWeight: FontWeight.w500,
      color: const Color(0xff272727),
      fontSize: 14);

  static TextStyle styleRegular15(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 15);
  }

  static TextStyle styleMedium24(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 24);
  }

  // static TextStyle styleBold24 = GoogleFonts.gabarito(
  //     fontWeight: FontWeight.bold,
  //     color: const Color(0xff272727),
  //     fontSize: 24);

  // static TextStyle styleBoldGarabito12 = GoogleFonts.gabarito(
  //     fontWeight: FontWeight.bold,
  //     color: const Color(0xff272727),
  //     fontSize: 12);

  // static TextStyle styleBold16 = GoogleFonts.gabarito(
  //     fontWeight: FontWeight.bold,
  //     color: const Color(0xff272727),
  //     fontSize: 16);
  static TextStyle styleBoldGarabito24(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 24,
        fontFamily: 'Gabarito');
  }

  static TextStyle styleBoldGarabito12 = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff272727),
      fontSize: 12,
      fontFamily: 'Gabarito');

  static TextStyle styleBold16 = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff272727),
      fontSize: 16,
      fontFamily: 'Gabarito');

  static TextStyle styleBoldGarabito32 = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff272727),
      fontSize: 32,
      fontFamily: 'Gabarito');

  static TextStyle styleSmeiBoldPoppins20 = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: const Color(0xff25213C));

  static TextStyle styleSmeiBoldPoppins16 = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xff25213C).withOpacity(.8));

  static TextStyle styleHintTextField16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? Colors.white.withOpacity(.5)
            : const Color(0xff272727).withOpacity(.5),
        fontSize: 16);
  }

  static TextStyle styleTextField18(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: 18);
  }

  static TextStyle styleBoldUrbainst24 = GoogleFonts.urbanist(
      fontWeight: FontWeight.bold,
      color: const Color(0xff8E6CEF),
      fontSize: 24);

  static TextStyle styleMediumUrbainst16 = GoogleFonts.urbanist(
      fontWeight: FontWeight.w500,
      color: const Color(0xff59606E),
      fontSize: 16);
}

bool _isDarkMode(BuildContext context) {
  return context.watch<ChangeThemeCubit>().isDarkMode;
}
