import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  RxBool isDisabled = true.obs;
  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString phoneNumber = ''.obs;

// Logic
// For enabling or disabling the button
  void onChanged(String value) {
    if (value.isEmpty) {
      isDisabled(true);
    } else {
      isDisabled(false);
    }
  }

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
  }

  void submitPhoneNumber() {
    // Perform any action with the phone number, such as validation or saving
    print('Submitted phone number: ${phoneNumber.value}');
  }
  void registerUser(String email, String password) {
    String? error =
        AuthService().signUpWithEmailPassword(email, password) as String?;
    if (error != null) {
      ShowSnackBar(
        message: error.toString(),
      );
    }
  }

  void phoneAuthentication(String phone) {
    AuthService().phoneAuthentication(phone);
  }
}
