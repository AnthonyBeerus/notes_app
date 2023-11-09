
import 'package:flutter/material.dart';
import 'package:notes_app/Themes/colors.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: backgroundMaterialColor,
    primary: brandMaterialColor,
    secondary: secondaryDarkMaterialColor,
    tertiary: tertiaryDarkMaterialColor,  
    secondaryContainer: textMaterialColor,
  ),
);
