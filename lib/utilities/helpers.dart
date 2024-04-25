import 'package:flutter/foundation.dart';

class Helpers {
  static void debugPrintt(dynamic string) {
    if (kDebugMode) {
      print(string);
    } else {
      return;
    }
  }
}
