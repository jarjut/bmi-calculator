import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widgets/app_bar.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MainAppBar(title: Text('BMI Results')),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 500,
            height: 700,
            padding: const EdgeInsets.symmetric(
              vertical: kVerticalPadding,
              horizontal: kHorizontalPadding,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 232,
                          height: 232,
                          decoration: const BoxDecoration(
                            color: kBackgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: kNeumorphicShadows2,
                          ),
                          child: CircularPercentIndicator(
                            radius: 96,
                            percent: 0.7,
                            lineWidth: 12.0,
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient: const LinearGradient(
                              colors: kPrimaryGradientColors,
                            ),
                            backgroundColor: Colors.grey.shade300,
                            center: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                bmi.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'Overpass',
                                  fontWeight: FontWeight.w300,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: kGapSize * 3),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontSize: 16.0,
                                ),
                            children: [
                              const TextSpan(text: 'You have'),
                              TextSpan(
                                text: ' ${getBMIResult(bmi)} ',
                                style: const TextStyle(color: kPrimaryColor),
                              ),
                              const TextSpan(text: 'body weight!'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyButton(
                  label: 'Try again',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const VerticalGap(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getBMIResult(double bmi) {
  if (bmi < 18.5) {
    return 'Under';
  } else if (bmi < 25) {
    return 'Normal';
  } else if (bmi < 30) {
    return 'Over';
  } else {
    return 'Obese';
  }
}
