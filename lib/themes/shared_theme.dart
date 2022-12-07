
import 'package:flutter/material.dart';

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
