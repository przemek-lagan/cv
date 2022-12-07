import 'package:cv/themes/shared_theme.dart';
import 'package:flutter/material.dart';


ThemeData darkTheme(double textScale) {
  ThemeData initialThemeData = ThemeData(brightness: Brightness.dark);
  ThemeData theme = assignSharedValues(initialThemeData, textScale);
  return theme.copyWith(
    textTheme: theme.textTheme.copyWith(
      headline2:
          theme.textTheme.headline2!.copyWith(color: Colors.blue.shade200),
      headline6:
          theme.textTheme.headline6!.copyWith(color: Colors.yellow.shade300),
    ),
  );
}
