import 'package:cv/home/pages/global.dart';
import 'package:flutter/material.dart';

WidgetSpan indentSpan(ScaleFactor scaleFactor) {
  return WidgetSpan(
      child: SizedBox(
    width: 20 * scaleFactor.value,
  ));
}
