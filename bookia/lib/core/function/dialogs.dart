import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.redColor,
    content: Text(text),
  ));
}

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
}
