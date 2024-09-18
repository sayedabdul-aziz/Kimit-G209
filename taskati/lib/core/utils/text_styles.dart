import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';

TextStyle getHeadingTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 24,
    color: color ?? AppColors.darkBackground,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 18,
    color: color ?? AppColors.darkBackground,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.darkBackground,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.greyColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
