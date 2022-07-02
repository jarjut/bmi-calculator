import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.title});

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: kTextColor,
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
