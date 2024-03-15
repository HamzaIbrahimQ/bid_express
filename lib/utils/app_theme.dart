import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  ThemeData appTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: bgColor,
      primaryColor: primaryColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(double.infinity, .073.sh)),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return Colors.red;
              } else if (states.contains(MaterialState.disabled)) {
                return disabledColor;
              } else if (states.contains(MaterialState.pressed)) {
                return pressedColor;
              } else
                return primaryColor;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),

      splashColor: primaryColor.withOpacity(.1),
      focusColor: primaryColor.withOpacity(.1),
      highlightColor: primaryColor.withOpacity(.1),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: 'SofiaPro',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 2.w),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return Colors.red;
              } else if (states.contains(MaterialState.disabled)) {
                return disabledColor;
              } else if (states.contains(MaterialState.pressed)) {
                return pressedColor;
              } else
                return textButtonColor;
            },
          ),
        ),
      ),

      textTheme: TextTheme(


        /// Headline
        headlineLarge: TextStyle(
          fontFamily: 'SofiaProSoft',
          color: secondaryColor,
          fontSize: 42.sp,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          color: primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),

        /// Label
        labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: secondaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: secondaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontFamily: 'SofiaPro',
          color: secondaryColor,
          fontSize: 14.sp,
          letterSpacing: 0,
        ),

        /// Body
        bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: appBarTitleColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: secondaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
