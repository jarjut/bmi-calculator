import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getBodyHeight(BuildContext context) {
  return getScreenSize(context).height -
      MediaQuery.of(context).viewPadding.top -
      MediaQuery.of(context).viewPadding.bottom -
      kToolbarHeight;
}

bool isSmallHeight(BuildContext context) {
  return getScreenSize(context).height < 700;
}
