import 'dart:developer';

import 'package:bookia/core/services/local/local_storage.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String? token;
    // AppLocalStorage.getData('token').then((value) {
    //   token = value;
    // });
    Future.delayed(const Duration(seconds: 3), () {
      // if (token != null) {
      //   pushReplacement(context, const NavBarWidget());
      // } else {
      //   pushReplacement(context, const WelcomeScreen());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250, child: SvgPicture.asset('assets/images/logo.svg')),
            const Gap(9),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(context),
            )
          ],
        ),
      ),
    );
  }
}
