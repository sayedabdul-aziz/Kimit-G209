import 'package:flutter/material.dart';
import 'package:se7ety/core/enums/user_type_enum.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/features/intro/onboarding/page/onboarding_screen.dart';
import 'package:se7ety/features/intro/welcome/welcome_view.dart';
import 'package:se7ety/features/patient/nav_bar_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      String? userType =
          AppLocalStorage.getCachedData(key: AppLocalStorage.userType);
      bool isOnboardingShown =
          AppLocalStorage.getCachedData(key: AppLocalStorage.onboarding) ??
              false;

      if (userType != null) {
        if (userType == UserType.patient.toString()) {
          pushAndRemoveUntil(context, const PatientNavBarWidget());
        } else {
          // push to doctor home
        }
      } else {
        if (isOnboardingShown) {
          pushReplacement(context, const WelcomeView());
        } else {
          pushReplacement(context, const OnboardingScreen());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
