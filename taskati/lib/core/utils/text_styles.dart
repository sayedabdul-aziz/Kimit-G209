import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';

TextStyle getHeadingTextStyle(context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 24,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getTitleTextStyle(context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.greyColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
