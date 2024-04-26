import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  static void debugPrintt(dynamic string) {
    if (kDebugMode) {
      print(string);
    } else {
      return;
    }
  }

  void showSnackBar(String message, {bool isSuccess = false}) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(message,
            style: TextStyle(
                color: isSuccess ? Colors.green : Colors.red,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white.withOpacity(0.9),
        duration:
            Duration(seconds: 3), // Customize duration according to your need
        snackPosition:
            SnackPosition.BOTTOM, // Set the position of the snack bar
      ),
    );
  }
}
