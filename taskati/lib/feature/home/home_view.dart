import 'package:flutter/material.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          children: [HomeHeaderWidget()],
        ),
      ),
    );
  }
}
