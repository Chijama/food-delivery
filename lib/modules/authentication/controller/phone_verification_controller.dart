import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/repository/authentication_repository.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';

class PhoneVerificationController extends GetxController {
  static PhoneVerificationController get instance => Get.find();

  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String phoneNumber = '';

  void verifyPhoneNumber(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const NavBar()) : Get.back();
  }
}
