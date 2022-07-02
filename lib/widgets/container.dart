import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/variables.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    Color? color,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.constraints,
    this.child,
  }) : color = color ?? kBackgroundColor;

  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      constraints: constraints,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(kRadius),
        boxShadow: kNeumorphicShadows,
        color: color,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
