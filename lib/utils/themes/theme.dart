import 'package:flutter/material.dart';
import 'package:news_app_updates_2024/config/colors.dart';

class AppThemes {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: lightScaffoldColor,
      primaryColor: lightCardColor,
      iconTheme: const IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(backgroundColor: lightBackgroundColor),
      hintColor: Colors.grey.shade700,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.blue,

        // selectionHandleColor: Colors.blue,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
      cardColor: lightCardColor,
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: lightIconsColor,
            brightness: Brightness.light,
          ),
    );
  }

  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: darkScaffoldColor,
      primaryColor: darkCardColor,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(backgroundColor: darkBackgroundColor),
      hintColor: Colors.grey.shade400,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.blue,

        // selectionHandleColor: Colors.blue,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      cardColor: darkCardColor,
      brightness: Brightness.dark,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: darkIconsColor,
            brightness: Brightness.dark,
          ),
    );
  }
}
