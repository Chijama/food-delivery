import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/modules/authentication/repository/user_repository.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  RxBool isDisabled = true.obs;
  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxString phoneNumber = ''.obs;

  final userRepo = Get.put(UserRepository());
// Logic
// For enabling or disabling the button
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    AuthService().phoneAuthentication(user.phoneNo);
       Get.toNamed(PhoneVerification.routeName,
                                  arguments: user.phoneNo);
  }

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
