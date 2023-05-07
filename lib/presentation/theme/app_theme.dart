import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(darkGrey),
      textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16)),
      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.black.withOpacity(0.05),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide.none,
    ),
  ),
  toggleButtonsTheme: ToggleButtonsThemeData(
    textStyle: const TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18.0),
    selectedColor: Colors.black,
    fillColor: primaryColor,
    borderRadius: BorderRadius.circular(32.0),
    borderWidth: 0,
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: const BorderSide(width: 1.0),
    ),
  ),
);
