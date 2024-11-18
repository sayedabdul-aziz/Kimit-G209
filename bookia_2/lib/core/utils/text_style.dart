import 'package:bookia_2/core/constants/assets_fonts.dart';
import 'package:flutter/material.dart';

TextStyle getHeadlineTextStyle(context, {double fontSize = 30, Color? color}) {
  return TextStyle(
    fontFamily: AssetsFonts.dMSerifDisplay,
    fontSize: fontSize,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

// title

TextStyle getTitleTextStyle(context, {double fontSize = 24, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getSubTitleTextStyle(context, {double fontSize = 20, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(context, {double fontSize = 18, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
// small

TextStyle getSmallTextStyle(context, {double fontSize = 15, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
