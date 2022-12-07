import 'package:flutter/foundation.dart';

class Global {
  static bool isMobile = defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
  static bool isWeb = kIsWeb;
}
