import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isUploaded = AppLocalStorage.getCachedData('isUploaded') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacement(
          context, (isUploaded) ? const HomeView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json'),
            Text('Taskati', style: getBodyTextStyle(context, fontSize: 24)),
            const Gap(16),
            Text('It\'s a time to be productive', style: getSmallTextStyle())
          ],
        ),
      ),
    );
  }
}
