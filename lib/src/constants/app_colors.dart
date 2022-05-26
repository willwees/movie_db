import 'package:flutter/material.dart';

class AppColors {
  static const Color kDarkBlue = Color(0xFF0D253F);
  static const Color kLightBlue = Color(0xFF01B4E4);
  static const Color kLightGreen = Color(0xFF90CEA1);

  static const MaterialColor kSwatchColors = MaterialColor(0xFF0D253F, <int, Color>{
    50: kLightBlue,
    100: kLightGreen,
    200: kDarkBlue,
    500: kDarkBlue,
    300: kDarkBlue,
    600: kLightBlue,
    700: kLightBlue,
  });
}
