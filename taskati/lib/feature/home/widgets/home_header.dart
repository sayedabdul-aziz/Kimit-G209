import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${AppLocalStorage.getCachedData('name')}',
              style: getTitleTextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w600),
            ),
            const Gap(5),
            Text('Have a nice day', style: getBodyTextStyle()),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 28,
          backgroundImage: AppLocalStorage.getCachedData('image') != null
              ? FileImage(File(AppLocalStorage.getCachedData('image')))
              : const AssetImage('assets/images/user.png'),
        )
      ],
    );
  }
}
