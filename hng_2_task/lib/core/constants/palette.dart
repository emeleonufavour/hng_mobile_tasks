import 'package:flutter/material.dart';

class Palette {
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color darkScaffold = Color(0xff000F24);

  static const Color transparent = Colors.transparent;

  static Color backgroundColor = Colors.indigo.withAlpha(50);

  static Color grey25 = Color(0xffFCFCFD);
  static Color grey100 = Color(0xffF2F4F7);
  static Color grey400 = Color(0xff98A2B3);
  static Color grey500 = Color(0xff667085);
  static Color grey200 = Color(0xff98A2B3).withValues(alpha: 0.2);
  static Color grey50 = Color(0xffEAECF0);
  static Color grey300 = Color(0xffD0D5DD);
  static Color grey900 = Color(0xff1C1917);
}
