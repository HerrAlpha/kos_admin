import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kos_admin/config/themes/colours.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get mainTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colours.black,
      scaffoldBackgroundColor: Colours.white,
      unselectedWidgetColor: const Color(0xffb5b5b5),
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 26.sp,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: Colours.black,
          height: 1.5,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            primary: Colours.black,
            secondary: Colours.white,
          )
          .copyWith(background: Colors.white),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colours.white,
        weekdayStyle: TextStyle(
          color: Colours.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        yearStyle: TextStyle(
          color: Colours.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),

        dayStyle: TextStyle(
          color: Colours.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        // Adjust the font size as needed
      ),
    );
  }
}
