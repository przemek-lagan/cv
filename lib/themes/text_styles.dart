import 'package:flutter/material.dart';

extension CustomStyles on TextTheme {
  TextStyle get sectionTitle =>
      headline1!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get startTitle => headline2!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get startSubtitle => headline3!;
  TextStyle get skillScatterText => headline6!;
}
