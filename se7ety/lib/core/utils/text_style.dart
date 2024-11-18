import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

TextStyle getTitleStyle(
        {Color? color,
        double? fontSize = 18,
        FontWeight? fontWeight = FontWeight.bold}) =>
    TextStyle(
      fontSize: fontSize,
      color: color ?? AppColors.color1,
      fontWeight: fontWeight,
    );

TextStyle getBodyStyle(
        {Color? color,
        double? fontSize = 14,
        FontWeight? fontWeight = FontWeight.w400}) =>
    TextStyle(
      fontSize: fontSize,
      color: color ?? AppColors.black,
      fontWeight: fontWeight,
    );

TextStyle getSmallStyle(
        {Color? color,
        double? fontSize = 12,
        FontWeight? fontWeight = FontWeight.w500}) =>
    TextStyle(
      fontSize: fontSize,
      color: color ?? AppColors.black,
      fontWeight: fontWeight,
    );
