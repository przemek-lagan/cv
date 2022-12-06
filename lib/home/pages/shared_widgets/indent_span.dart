import 'package:cv/globals/enums.dart';
import 'package:flutter/material.dart';

WidgetSpan indentSpan(PageLayout scaleFactor) {
  return WidgetSpan(
      child: SizedBox(
    width: 20 * scaleFactor.value,
  ));
}
