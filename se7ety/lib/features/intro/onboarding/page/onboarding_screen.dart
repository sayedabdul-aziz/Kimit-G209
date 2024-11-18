import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/features/intro/onboarding/model/onboarding_model.dart';
import 'package:se7ety/features/intro/welcome/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
              onPressed: () {
                AppLocalStorage.cacheData(
                    key: AppLocalStorage.onboarding, value: true);
                push(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getBodyStyle(color: AppColors.color1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            SvgPicture.asset(
                              onboardingPages[index].image,
                              width: 300,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              onboardingPages[index].title,
                              style: getTitleStyle(),
                            ),
                            const Gap(20),
                            Text(
                              onboardingPages[index].description,
                              style: getBodyStyle(),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(
                              flex: 4,
                            )
                          ],
                        ),
                      );
                    })),
            SizedBox(
              height: 45,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingPages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.color1,
                      dotHeight: 13,
                      dotWidth: 13,
                      spacing: 5,
                    ),
                  ),
                  const Spacer(),
                  if (currentPage == onboardingPages.length - 1)
                    CustomButton(
                      width: 120,
                      height: 45,
                      text: 'هيا بنا',
                      onPressed: () {
                        AppLocalStorage.cacheData(
                            key: AppLocalStorage.onboarding, value: true);
                        push(context, const WelcomeView());
                      },
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
