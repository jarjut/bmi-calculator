import 'package:bmi_calculator/constants/variables.dart';
import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  const VerticalGap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kGapSize);
  }
}

class HorizontalGap extends StatelessWidget {
  const HorizontalGap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: kGapSize);
  }
}
