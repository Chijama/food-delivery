import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/repository/user_repository.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/utilities/helpers.dart';

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
  final authRepo = AuthenticationRepository.instance;

// Logic
// For enabling or disabling the button
  Future<void> createUserWithPhoneverification(UserModel user) async {
    isLoading(true);
    debugPrint('Loading Start');
    await userRepo.createUser(user, isLoading.value);
    debugPrint('create user done');

    authRepo.phoneAuthentication(user.phoneNo);

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
    debugPrint('Loading Start');
    try {
      // Step 1: Authenticate the user first
      debugPrint('Authenticate user begin');

      var authResult = await authRepo.createUserWithEmailAndPassword(
          user.email, user.password);
      debugPrint('Authentication done');

      // Check if authentication was successful and user is returned
      if (authResult.user != null) {
        debugPrint('Create user data begin');
        // Step 2: Create user data in Firestore after successful authentication
        try {
          await userRepo.createUser(user, isLoading.value);
          debugPrint('Create user data done');
          Helpers()
              .showSnackBar('Success: Account created and user data saved!');
        } catch (e) {
          Helpers().showSnackBar('Error: Something went wrong. Try again.');
          debugPrint(e.toString());
          isLoading(false);
          throw Exception('Failed to create user');
        }
      } else {
        // Handle the case where no user is returned after authentication
        debugPrint('Authentication succeeded but no user returned');
        Helpers().showSnackBar(
            'Authentication succeeded but no user data was returned.');
        Get.offAll(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      } else {
        debugPrint('Registration error: ${e.message}');
        Helpers().showSnackBar('Sign up failed: ${e.toString()}');
        Get.offAll(() => const WelcomeScreen());
      }
    } finally {
      debugPrint('Loading DONE');
      isLoading(false); // Ensure loading stops regardless of outcome
    }
    authRepo.setInitialScreen(authRepo.firebaseUser.value);
    
  }

  void phoneAuthentication(String phone) {
    authRepo.phoneAuthentication(phone);
  }
}
