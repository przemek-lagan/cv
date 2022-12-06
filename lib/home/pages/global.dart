import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Global {
  static late List<String> titles;
  static late List<Icon> icons;
  static late List<Widget> pages;

  static bool isMobile = defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
  static bool isWeb = kIsWeb;
}
