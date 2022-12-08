import 'package:cv/themes/shared_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(double textScale) {
  ThemeData initialThemeData = ThemeData();
  ThemeData theme = assignSharedValues(initialThemeData, textScale);
  return theme.copyWith(
    textTheme: theme.textTheme.copyWith(
      headline2:
          theme.textTheme.headline2!.copyWith(color: Colors.blue.shade800),
      headline6:
          theme.textTheme.headline6!.copyWith(color: Colors.orange.shade800),
    ),
  );
}
