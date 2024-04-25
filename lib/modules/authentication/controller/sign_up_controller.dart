import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/modules/authentication/repository/authentication_repository.dart';
import 'package:jammybread/modules/authentication/repository/user_repository.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  RxBool isDisabled = true.obs;
  var isLoading = false.obs; // Observable for loading state
  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  RxString phoneNumber = ''.obs;

  final userRepo = Get.put(UserRepository());
// Logic
// For enabling or disabling the button
  Future<void> createUserWithPhoneverification(UserModel user) async {
    isLoading(true);
    print('Loading Start');
    await userRepo.createUser(user, isLoading.value);
    print('create user done');

    AuthenticationRepository.instance.phoneAuthentication(user.phoneNo);

    isLoading(false);
    Get.toNamed(PhoneVerification.routeName, arguments: user.phoneNo);
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



  void createrUserWithEmailSignIn(UserModel user) async {
    isLoading(true);
    print('Loading Start');
    try {
      // Step 1: Authenticate the user first
      print('Authenticate user begin');
      var authResult = await AuthService()
          .signUpWithEmailPassword(user.email, user.password);
      print('Authentication done');

      // Check if authentication was successful and user is returned
      if (authResult.user != null) {
        print('Create user data begin');
        // Step 2: Create user data in Firestore after successful authentication
        await userRepo.createUser(user, isLoading.value);
        print('Create user data done');
        ShowSnackBar(message: 'Success: Account created and user data saved!');
      } else {
        // Handle the case where no user is returned after authentication
        print('Authentication succeeded but no user returned');
        ShowSnackBar(
            message: 'Authentication succeeded but no user data was returned.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Registration error: ${e.message}');
        ShowSnackBar(message: 'Sign up failed: ${e.toString()}');
      }
    } finally {
      print('Loading DONE');
      isLoading(false); // Ensure loading stops regardless of outcome
      Get.toNamed(NavBar.routeName);
    }
  }

  void phoneAuthentication(String phone) {
    AuthService().phoneAuthentication(phone);
  }
}
