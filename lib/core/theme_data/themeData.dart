import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';

class MyThemeDataPage {
  static Color lightPrimary = AppColors.primary;
  static Color lightSecondary = AppColors.secondary;

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.white70,
    hintColor: Colors.black12.withOpacity(.5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(lightPrimary),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(
            Colors.white)
        )
    ),
    iconTheme: IconThemeData(
        color: lightPrimary,
        size: 30
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: lightPrimary),
    useMaterial3: true,
  );
}
