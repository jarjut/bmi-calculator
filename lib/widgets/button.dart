import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/variables.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isDown = false;

  void onTapUp() {
    setState(() => isDown = false);
    widget.onPressed.call();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => isDown = true),
        onTapUp: (_) => setState(() => onTapUp()),
        onTapCancel: () => setState(() => onTapUp()),
        onPanEnd: (_) => setState(() => onTapUp()),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          height: kResponsiveButtonHeight(context),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: kPrimaryGradientColors),
            borderRadius: const BorderRadius.all(kRadius),
            boxShadow: isDown ? null : kNeumorphicShadows,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatefulWidget {
  const MyIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  bool isDown = false;

  void onTapUp() {
    setState(() => isDown = false);
    widget.onPressed.call();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => isDown = true),
        onTapUp: (_) => setState(() => onTapUp()),
        onTapCancel: () => setState(() => onTapUp()),
        onPanEnd: (_) => setState(() => onTapUp()),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: const BorderRadius.all(kRadius),
            boxShadow: isDown ? null : kNeumorphicShadows,
          ),
          alignment: Alignment.center,
          child: Icon(
            widget.iconData,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
