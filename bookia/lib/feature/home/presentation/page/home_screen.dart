import 'package:bookia/feature/home/presentation/widgets/home_banner.dart';
import 'package:bookia/feature/home/presentation/widgets/popular_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 120,
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/notification.svg')),
            const Gap(20),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/search.svg')),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gap(15),
          HomeBanner(),
          Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('New Arrivals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          PopularBooks(),
        ]),
      ),
    );
  }
}
