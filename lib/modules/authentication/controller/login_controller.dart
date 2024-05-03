import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/utilities/helpers.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  RxBool isDisabled = true.obs;
  var isLoading = false.obs; // Observable for loading state
  // final userRepo = Get.put(UserRepository());
  final authRepo = Get.put(AuthenticationRepository());
  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onChanged(String value) {
    if (value.isEmpty) {
      isDisabled(true);
    } else {
      isDisabled(false);
    }
  }

  Future<void> login(String email, String password) async {
    isLoading(true);

    debugPrint('Loading Start');
    try {
      await authRepo.loginWithEmailAndPassword(email, password);

      // Check if the user is correctly logged in and maybe other conditions
      if (authRepo.firebaseUser.value != null) {
        if (authRepo.firebaseUser.value!.emailVerified) {
          Helpers().showSnackBar('Success: Logged In', isSuccess: true);

          // Navigate based on the user's authentication status
          authRepo.setInitialScreen(authRepo.firebaseUser.value);
        } else {
          Helpers().showSnackBar('Error: User not verified.');

        }
      } else {
        // Handle case where login is not fully successful according to your criteria
        Helpers().showSnackBar('Error: User not found.');
      }
    } on FirebaseAuthException catch (e) {
      Helpers().showSnackBar(e.toString());
      debugPrint(e.toString());
    } catch (e) {
      // Handle other possible errors that could occur
      Helpers().showSnackBar(e.toString());
      debugPrint('Error logging in: ${e.toString()}');
    } finally {
      debugPrint('Loading DONE');
      isLoading(false);
    }

    // authRepo.onReady();
  }
 
}
