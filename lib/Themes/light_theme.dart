
import 'package:flutter/material.dart';
import 'package:notes_app/Themes/colors.dart';


ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: backgroundMaterialColorLight,
    primary: brandMaterialColorLight,
    secondary: secondaryMaterialColorLight,
    tertiary: tertiaryMaterialColorLight,
    secondaryContainer: textMaterialColorLight,
  ),
);
