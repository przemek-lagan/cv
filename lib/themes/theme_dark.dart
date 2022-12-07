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

ThemeData assignSharedValues(ThemeData theme, double textScale) {
  return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
    // sectionTitle
    headline1: theme.textTheme.bodyText1!.copyWith(fontSize: 26 * textScale),
    // startTitle
    headline2: theme.textTheme.bodyText1!.copyWith(fontSize: 22 * textScale),
    // startSubtitle
    headline3: theme.textTheme.bodyText1!.copyWith(fontSize: 18 * textScale),
    // (startText)
    bodyText1: theme.textTheme.bodyText1!.copyWith(fontSize: 16 * textScale),
    // skillScatterText
    headline6: theme.textTheme.bodyText1!
        .copyWith(fontSize: 16 * textScale * textScale),
    // general headline
    headline4: theme.textTheme.bodyText1!.copyWith(fontSize: 22 * textScale),
    // (ListTile Title)
    subtitle1: theme.textTheme.bodyText1!.copyWith(fontSize: 16 * textScale),
  ));
}

// ThemeData sharedTheme(double textScale) {
//   return ThemeData(
//       textTheme: TextTheme(
//     headline1: TextStyle(fontSize: 26 * textScale),
//   ));
//   return ThemeData(
//       brightness: Brightness.dark,
//       textTheme: TextTheme(
//         headline1: const TextStyle(fontSize: 12),


//         // headline4: TextS,
//         bodyText1: const TextStyle(fontSize: 30),
//         bodyText2: TextStyle(fontSize: 16 * textScale),
//       ));
// }
