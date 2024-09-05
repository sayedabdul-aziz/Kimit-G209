import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result});
  final double result;

// Severe Thinness	< 16
// Moderate Thinness	16 - 17
// Mild Thinness	17 - 18.5
// Normal	18.5 - 25
// Overweight	25 - 30
// Obese Class I	30 - 35
// Obese Class II	35 - 40
// Obese Class III	> 40

  String getClassification() {
    if (result < 16) {
      return 'Severe Thinness';
    } else if (result >= 16 && result <= 17) {
      return 'Moderate Thinness';
    } else if (result >= 17 && result <= 18.5) {
      return 'Mild Thinness';
    } else if (result >= 18.5 && result <= 25) {
      return 'Normal';
    } else if (result >= 25 && result <= 30) {
      return 'Overweight';
    } else if (result >= 30 && result <= 35) {
      return 'Obese Class I';
    } else if (result >= 35 && result <= 40) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0c21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0c21),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getClassification(),
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result.toStringAsFixed(2),
              style: const TextStyle(color: Colors.white, fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
