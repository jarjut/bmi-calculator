import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/utils.dart';
import 'package:flutter/material.dart';

const Radius kRadius = Radius.circular(16.0);
const double kButtonHeight = 52.0;
double kResponsiveButtonHeight(BuildContext context) {
  return isSmallHeight(context) ? kButtonHeight * 0.75 : kButtonHeight;
}

const double kVerticalPadding = 20;
const double kHorizontalPadding = 20;
double kResponsiveVerticalPadding(BuildContext context) {
  return isSmallHeight(context) ? kVerticalPadding / 2 : kVerticalPadding;
}

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

const List<BoxShadow> kNeumorphicShadows2 = [
  BoxShadow(
    color: kNeumorphicTopColor,
    offset: Offset(-8, -8),
    blurRadius: 15,
    spreadRadius: kNeumorphicSpreadRadius,
  ),
  BoxShadow(
    color: kNeumorphicBottomColor,
    offset: Offset(8, 8),
    blurRadius: 15,
    spreadRadius: kNeumorphicSpreadRadius,
  ),
];
