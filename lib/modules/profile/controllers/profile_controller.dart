import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/repository/user_repository.dart';
import 'package:jammybread/utilities/helpers.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  RxBool isDisabled = true.obs;
  final Rx<dynamic> _currentValue = Rx<dynamic>(null);
  dynamic get currentValue => _currentValue.value;

  getUserData() {
    try {
      final String email = _authRepo.firebaseUser.value!.email!;
      return _userRepo.getUserDetails(email);
    } catch (e) {
      debugPrint('Error getting user data: $e');
      Helpers().showSnackBar("Error: Login to continue");

      rethrow; // Re-throw the error to be caught by FutureBuilder
    }

    // if (email != null) {
    //   return _userRepo.getUserDetails(email);
    // } else {
    //   const Helpers().showSnackBar( "Error: Login to continue");
    // }
  }

  updateRecord(UserModel user) async {
    try {
      await _userRepo.updateUserRecord(user);
      Helpers().showSnackBar("Success", isSuccess: true);
      debugPrint('Success');
    } catch (e) {
      debugPrint('Error updating user data: $e');
      Helpers().showSnackBar("Error: $e");

      rethrow; // Re-throw the error to be caught by FutureBuilder
    }
  }

 deleteRecord(String? userId) async {
  if (userId == null) {
    debugPrint("No user logged in");
    Helpers().showSnackBar("No user logged in");
    return;
  }

  try {
    // First delete user data from Firestore
    await _userRepo.deleteUserFromFirestore(userId);
    debugPrint("User data deleted from Firestore");
    
    // Then delete user from Authentication
    await _authRepo.deleteUserFromAuth();
    debugPrint("User deleted from Authentication");

    Helpers().showSnackBar("User completely removed from both Auth and Firestore");
    _authRepo.logout(); // Ensure you logout the user and clear session

  } catch (e) {
    debugPrint('Error updating user data: $e');
    Helpers().showSnackBar("Error updating user data: $e");
    rethrow; // Re-throw the error to be caught by higher-level error handling mechanisms
  } finally {
    // Optionally navigate the user to the appropriate screen
    _authRepo.setInitialScreen(null);
  }
}


  valueController(dynamic initialValue) {
    _currentValue.value = initialValue;
  }

  void onChanged(dynamic newValue) {
    if (_currentValue.value != newValue) {
      _currentValue.value = newValue;
      isDisabled(true);
    }
    isDisabled(false);
  }

  void logOut() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch (e) {
      Helpers().showSnackBar(e.toString());
      rethrow;
    }
    Get.offAll(() => const WelcomeScreen());
  }
}
