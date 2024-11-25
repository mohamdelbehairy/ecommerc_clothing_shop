import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle styleBold32(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 32));
  }

  static TextStyle styleBoldNunito24(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 24));
  }

  static TextStyle styleBold20(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 20));
  }

  static TextStyle styleMedium16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 16));
  }

  static TextStyle styleMedium16WithOpacity(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? AppColors.whiteColor.withOpacity(.5)
            : AppColors.blackColor.withOpacity(.5),
        fontSize: _getResponsiveFontSize(context, 16));
  }

  static TextStyle styleMediumWhite16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
        fontSize: _getResponsiveFontSize(context, 16));
  }

  static TextStyle styleSemiBoldWhite20(BuildContext context) {
    return GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
        fontSize: _getResponsiveFontSize(context, 20));
  }

  static TextStyle styleBoldNunito1(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 12));
  }

  static TextStyle styleMedium12(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 12));
  }

  static TextStyle styleMediumWithOpacity12(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? AppColors.whiteColor.withOpacity(.5)
            : AppColors.blackColor.withOpacity(.5),
        fontSize: _getResponsiveFontSize(context, 12));
  }

  static TextStyle styleMediumWithOpacity16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? AppColors.whiteColor.withOpacity(.5)
            : AppColors.blackColor.withOpacity(.5),
        fontSize: _getResponsiveFontSize(context, 16));
  }

  static TextStyle styleMedium14(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 14));
  }

  static TextStyle styleRegular15(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 15));
  }

  static TextStyle styleMedium24(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 24));
  }

  static TextStyle styleBoldGarabito24(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 24),
        fontFamily: 'Gabarito');
  }

  static TextStyle styleBoldGarabito12(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 12),
        fontFamily: 'Gabarito');
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 16),
        fontFamily: 'Gabarito');
  }

  static TextStyle styleBottomSheetAgeBold16(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 16),
        fontFamily: 'Gabarito');
  }

  static TextStyle styleBoldGarabito32(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color:
            _isDarkMode(context) ? AppColors.whiteColor : AppColors.blackColor,
        fontSize: _getResponsiveFontSize(context, 32),
        fontFamily: 'Gabarito');
  }

  static TextStyle styleSmeiBoldPoppins20(BuildContext context) {
    return GoogleFonts.poppins(
        fontSize: _getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w600,
        color: const Color(0xff25213C));
  }

  static TextStyle styleSmeiBoldPoppins16(BuildContext context) {
    return GoogleFonts.poppins(
        fontSize: _getResponsiveFontSize(context, 16),
        fontWeight: FontWeight.w600,
        color: const Color(0xff25213C).withOpacity(.8));
  }

  static TextStyle styleHintTextField16(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context)
            ? AppColors.whiteColor.withOpacity(.5)
            : AppColors.blackColor.withOpacity(.5),
        fontSize: _getResponsiveFontSize(context, 16));
  }

  static TextStyle styleTextField18(BuildContext context) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        color: _isDarkMode(context) ? Colors.white : const Color(0xff272727),
        fontSize: _getResponsiveFontSize(context, 18));
  }

  static TextStyle styleBoldUrbainst24(BuildContext context) {
    return GoogleFonts.urbanist(
        fontWeight: FontWeight.bold,
        color: const Color(0xff8E6CEF),
        fontSize: _getResponsiveFontSize(context, 24));
  }

  static TextStyle styleMediumUrbainst16(BuildContext context) {
    return GoogleFonts.urbanist(
        fontWeight: FontWeight.w500,
        color: const Color(0xff59606E),
        fontSize: _getResponsiveFontSize(context, 16));
  }
}

double _getResponsiveFontSize(BuildContext context, double fontSize) {
  var scallFactor = _getScallFactor(context);
  var responsiveFontSize = scallFactor * fontSize;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double _getScallFactor(BuildContext context) {
  var width = MediaQuery.sizeOf(context).width;

  return width / 550;
}

bool _isDarkMode(BuildContext context) {
  return context.watch<BuildAppCubit>().isDarkMode;
}
