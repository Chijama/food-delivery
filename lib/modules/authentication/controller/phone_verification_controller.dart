import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class PhoneVerificationController extends GetxController {
  static PhoneVerificationController get instance => Get.find();

  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String phoneNumber = '';

  void verifyPhoneNumber(String otp) async {
    var isVerified = await AuthService().verifyOTP(otp);
    isVerified ? Get.offAll(NavBar()) : Get.back();
  }
}
