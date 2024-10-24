import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/intro/presentation/page/welcome_screen.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, const WelcomeScreen());
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
            Gap(9),
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
