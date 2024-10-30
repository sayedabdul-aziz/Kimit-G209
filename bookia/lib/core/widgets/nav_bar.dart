import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const Text('Favourite'),
    const Text('Cart'),
    const Text('Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // selectedItemColor: AppColors.primaryColor,
        // unselectedItemColor: AppColors.greyColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/Home.svg',
                color: AppColors.primaryColor,
              ),
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/Bookmark.svg',
                color: AppColors.primaryColor,
              ),
              icon: SvgPicture.asset('assets/icons/Bookmark.svg'),
              label: 'Favourite'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/Category.svg',
                color: AppColors.primaryColor,
              ),
              icon: SvgPicture.asset('assets/icons/Category.svg'),
              label: 'Cart'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                color: AppColors.primaryColor,
              ),
              icon: SvgPicture.asset('assets/icons/Profile.svg'),
              label: 'Profile'),
        ],
      ),
    );
  }
}
