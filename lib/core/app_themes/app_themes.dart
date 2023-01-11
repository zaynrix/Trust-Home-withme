import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColorLight: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    focusColor: AppColors.primaryColor,
    appBarTheme: _getAppBarTheme(),
    checkboxTheme: _getCheckboxThemeData(),
    textTheme: _getTextTheme(),
    buttonTheme: _getButtonThemeData(),
    cardTheme: _getCardTheme(),
  );
}

AppBarTheme _getAppBarTheme() => const AppBarTheme(
    elevation: 0.0,
    backgroundColor: AppColors.headLine2Color,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: AppColors.headLine1Color,
        fontSize: AppSizes.fontSize18,
        fontWeight: FontWeight.w700,
        fontFamily: AppTexts.appFontFamily));

CheckboxThemeData _getCheckboxThemeData() => CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius8.r),
        side: const BorderSide(color: AppColors.borderColor)),
    side: const BorderSide(color: AppColors.borderColor));

TextTheme _getTextTheme() => const TextTheme(
    headline1: TextStyle(
        color: AppColors.headLine1Color,
        fontSize: AppSizes.fontSize24,
        fontWeight: FontWeight.w700,
        fontFamily: AppTexts.appFontFamily),
    headline2: TextStyle(
        color: AppColors.headLine2Color,
        fontSize: AppSizes.fontSize18,
        fontWeight: FontWeight.w500,
        fontFamily: AppTexts.appFontFamily),
    headline3: TextStyle(
        color: AppColors.headLine3Color,
        fontSize: AppSizes.fontSize14,
        fontWeight: FontWeight.w400,
        fontFamily: AppTexts.appFontFamily),
    headline4: TextStyle(
        color: AppColors.headLine4Color,
        fontSize: AppSizes.fontSize12,
        fontWeight: FontWeight.w500,
        fontFamily: AppTexts.appFontFamily),
    headline5: TextStyle(
        color: AppColors.primaryColor,
        fontSize: AppSizes.fontSize12,
        fontWeight: FontWeight.w500,
        fontFamily: AppTexts.appFontFamily),
    headline6: TextStyle(
        color: AppColors.headLine1Color,
        fontSize: AppSizes.fontSize16,
        fontWeight: FontWeight.w700,
        fontFamily: AppTexts.appFontFamily),
    bodyText1: TextStyle(
        color: AppColors.headLine1Color,
        fontSize: AppSizes.fontSize18,
        fontWeight: FontWeight.w600,
        fontFamily: AppTexts.appFontFamily),
    caption: TextStyle(
        color: AppColors.hintTextColor,
        fontSize: AppSizes.fontSize14,
        fontWeight: FontWeight.w500,
        fontFamily: AppTexts.appFontFamily));

ButtonThemeData _getButtonThemeData() => ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius12)),
    height: AppSizes.height57.h,
    minWidth: double.infinity);

CardTheme _getCardTheme() => CardTheme(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius8.r),
      ),
    );
