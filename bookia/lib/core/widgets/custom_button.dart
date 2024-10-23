import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = 250,
    this.height = 50,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.color = AppColors.primaryColor,
    this.radius = 10,
  });
  final double width;
  final double height;
  final String text;
  final Function() onTap;
  final TextStyle? textStyle;
  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: textStyle ??
                getSmallTextStyle(context, color: AppColors.whiteColor),
          )),
    );
  }
}
