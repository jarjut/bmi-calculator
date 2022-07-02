import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/variables.dart';
import 'package:bmi_calculator/widgets/app_bar.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/container.dart';
import 'package:bmi_calculator/widgets/helper.dart';
import 'package:bmi_calculator/widgets/radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

enum Gender {
  male,
  female,
}

class BmiCalculateScreen extends StatefulWidget {
  const BmiCalculateScreen({super.key});

  @override
  State<BmiCalculateScreen> createState() => _BmiCalculateScreenState();
}

class _BmiCalculateScreenState extends State<BmiCalculateScreen> {
  Gender? selectedGender = Gender.male;
  double height = 150;
  final weightTextController = TextEditingController(text: '60');
  final ageTextController = TextEditingController(text: '20');

  void onGenderChange(Gender? value) => setState(() {
        if (value == null) return;
        selectedGender = value;
      });

  void changeWeight(int value) {
    var currentWeight = int.parse(weightTextController.text);
    currentWeight += value;
    if (currentWeight < 0) currentWeight = 0;
    weightTextController.text = currentWeight.toString();
  }

  void changeAge(int value) {
    var currentAge = int.parse(ageTextController.text);
    currentAge += value;
    if (currentAge < 0) currentAge = 0;
    ageTextController.text = currentAge.toString();
  }

  @override
  void dispose() {
    weightTextController.dispose();
    ageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MainAppBar(
        title: Text('BMI Calculator'),
      ),
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
                Row(
                  children: [
                    Expanded(
                      child: MyRadio(
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: onGenderChange,
                        label: 'Male',
                      ),
                    ),
                    const HorizontalGap(),
                    Expanded(
                      child: MyRadio(
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: onGenderChange,
                        label: 'Female',
                      ),
                    ),
                  ],
                ),
                const VerticalGap(),
                const VerticalGap(),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: MyContainer(
                          padding: const EdgeInsets.only(
                            top: kVerticalPadding,
                            bottom: kVerticalPadding / 2,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Height (cm)',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: SfSliderTheme(
                                    data: SfSliderThemeData(
                                      tickOffset: const Offset(24, 0),
                                      labelOffset: const Offset(16, 0),
                                      activeTickColor: kLabelTextColor,
                                      inactiveTickColor: kLabelTextColor,
                                      tickSize: const Size(20, 1),
                                      minorTickSize: const Size(16, 1),
                                      tooltipBackgroundColor: kPrimaryColor,
                                    ),
                                    child: SfSlider.vertical(
                                      value: height,
                                      min: 100,
                                      max: 230,
                                      onChanged: (value) {
                                        setState(() => height = value);
                                      },
                                      activeColor: kPrimaryColor,
                                      inactiveColor:
                                          kPrimaryColor.withOpacity(0.2),
                                      showTicks: true,
                                      showLabels: true,
                                      enableTooltip: true,
                                      tooltipPosition:
                                          SliderTooltipPosition.right,
                                      interval: 10,
                                      minorTicksPerInterval: 1,
                                      tooltipTextFormatterCallback:
                                          (value, format) {
                                        return '${value.toInt()} cm';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const HorizontalGap(),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: MyContainer(
                                padding: const EdgeInsets.symmetric(
                                  vertical: kVerticalPadding,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      'Weight (kg)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: TextField(
                                          controller: weightTextController,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 60,
                                            fontFamily: 'Overpass',
                                            fontWeight: FontWeight.w300,
                                            color: kTextColor,
                                          ),
                                          cursorColor: kPrimaryColor,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          maxLength: 3,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            counter: SizedBox.shrink(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MyIconButton(
                                            iconData: Icons.add,
                                            onPressed: () => changeWeight(1),
                                          ),
                                          const SizedBox(width: kGapSize),
                                          MyIconButton(
                                            iconData: Icons.remove,
                                            onPressed: () => changeWeight(-1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalGap(),
                            Expanded(
                              child: MyContainer(
                                padding: const EdgeInsets.symmetric(
                                  vertical: kVerticalPadding,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      'Age',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: TextField(
                                          controller: ageTextController,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 60,
                                            fontFamily: 'Overpass',
                                            fontWeight: FontWeight.w300,
                                            color: kTextColor,
                                          ),
                                          cursorColor: kPrimaryColor,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          maxLength: 3,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            counter: SizedBox.shrink(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MyIconButton(
                                            iconData: Icons.add,
                                            onPressed: () => changeAge(1),
                                          ),
                                          const SizedBox(width: kGapSize),
                                          MyIconButton(
                                            iconData: Icons.remove,
                                            onPressed: () => changeAge(-1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalGap(),
                const VerticalGap(),
                MyButton(
                  label: "Let's Begin",
                  onPressed: () {},
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
