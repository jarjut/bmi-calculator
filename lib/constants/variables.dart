import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/painting.dart';

const Radius kRadius = Radius.circular(16.0);
const double kButtonHeight = 52.0;
const double kVerticalPadding = 20;
const double kHorizontalPadding = 20;
const double kGapSize = 20.0;

// Neumorphic
const double kNeumorphicBlurRadius = 5.0;
const double kNeumorphicSpreadRadius = 1.0;
const double kNeumorphicDepth = 4.0;
const List<BoxShadow> kNeumorphicShadows = [
  BoxShadow(
    color: kNeumorphicTopColor,
    offset: Offset(-kNeumorphicDepth, -kNeumorphicDepth),
    blurRadius: kNeumorphicBlurRadius,
    spreadRadius: kNeumorphicSpreadRadius,
  ),
  BoxShadow(
    color: kNeumorphicBottomColor,
    offset: Offset(kNeumorphicDepth, kNeumorphicDepth),
    blurRadius: kNeumorphicBlurRadius,
    spreadRadius: kNeumorphicSpreadRadius,
  ),
];
