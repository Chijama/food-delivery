import 'package:flutter/material.dart';
import 'package:jammybread/utilities/colors.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: light80,
      ),
      textTheme: const TextTheme());

       static ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: dark100,
      ),
      textTheme: const TextTheme());
}
