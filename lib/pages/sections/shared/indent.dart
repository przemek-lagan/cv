import 'package:cv/globals/enums.dart';
import 'package:flutter/material.dart';

WidgetSpan indentSpan(PageLayout pageLayout, {double count = 1}) {
  return WidgetSpan(
    child: indentWidget(pageLayout, count: count),
  );
}

Widget indentWidget(PageLayout pageLayout, {double count = 1}) {
  return SizedBox(
    width: 30 * count * pageLayout.textScale,
  );
}
