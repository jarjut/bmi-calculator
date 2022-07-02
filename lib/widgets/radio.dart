import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class MyRadio<T> extends StatefulWidget {
  const MyRadio({
    super.key,
    required this.value,
    required this.label,
    this.groupValue,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;

  bool get _selected => value == groupValue;

  @override
  State<MyRadio<T>> createState() => _MyRadioState<T>();
}

class _MyRadioState<T> extends State<MyRadio<T>> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onChanged?.call(widget.value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: kButtonHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(kRadius),
            gradient: LinearGradient(
              colors: widget._selected
                  ? kPrimaryGradientColors
                  : [kBackgroundColor, kBackgroundColor],
            ),
            boxShadow: kNeumorphicShadows,
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color:
                        widget._selected ? kBackgroundColor : kLabelTextColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
