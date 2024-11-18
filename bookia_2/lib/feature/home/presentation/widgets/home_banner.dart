import 'package:bookia_2/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    super.key,
  });

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/welcome_bg.png'),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                        'Find out the best books to read when you don’t even know what to read!!! '),
                    Gap(10),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 140,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        const Gap(15),
        SmoothPageIndicator(
          controller: PageController(initialPage: currentIndex),
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.borderColor,
            expansionFactor: 4,
            spacing: 5,
          ),
        ),
      ],
    );
  }
}
