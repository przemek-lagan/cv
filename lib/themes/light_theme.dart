import 'package:cv/themes/shared_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(double textScale) {
  ThemeData initialThemeData = ThemeData();
  ThemeData theme = assignSharedValues(initialThemeData, textScale);
  return theme.copyWith(
      // textTheme: theme.textTheme.copyWith(
      //   headline1: theme.textTheme.headline1!.copyWith(color: Colors.red),
      // ),
      );
}