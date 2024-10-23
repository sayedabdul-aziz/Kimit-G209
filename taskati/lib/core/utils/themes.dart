import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: "poppins",
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontFamily: "poppins", fontWeight: FontWeight.w500),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          onSurface: AppColors.darkBackground),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontFamily: "poppins",
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(10))));

  static ThemeData darkTheme = ThemeData(
      fontFamily: "poppins",
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontFamily: "poppins", fontWeight: FontWeight.w500),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontFamily: "poppins",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(10))));
}
