import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/screens/bmi_calculate_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              displayColor: kTextColor,
              bodyColor: kTextColor,
              fontFamily: 'Overpass',
            )
            .copyWith(
              titleMedium: const TextStyle(
                color: kLabelTextColor,
              ),
            ),
      ),
      home: const BmiCalculateScreen(),
    );
  }
}
