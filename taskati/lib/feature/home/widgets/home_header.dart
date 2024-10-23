import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/profile/profile_view.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${AppLocalStorage.getCachedData('name')}',
              style: getTitleTextStyle(context,
                  color: AppColors.primaryColor, fontWeight: FontWeight.w600),
            ),
            const Gap(5),
            Text('Have a nice day',
                style: getBodyTextStyle(
                  context,
                )),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            pushTo(context, const ProfileView()).then((value) {
              setState(() {});
            });
          },
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AppLocalStorage.getCachedData('image') != null
                ? FileImage(File(AppLocalStorage.getCachedData('image')))
                : const AssetImage('assets/images/user.png'),
          ),
        )
      ],
    );
  }
}
