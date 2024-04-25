import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/repository/user_repository.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

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
      const ShowSnackBar(message: "Error: Login to continue");

      rethrow; // Re-throw the error to be caught by FutureBuilder
    }

    // if (email != null) {
    //   return _userRepo.getUserDetails(email);
    // } else {
    //   const ShowSnackBar(message: "Error: Login to continue");
    // }
  }

  updateRecord(UserModel user) async {
    try {
      await _userRepo.updateUserRecord(user);
      const ShowSnackBar(
        message: "Success",
        success: true,
      );
      debugPrint('Success');
    } catch (e) {
      debugPrint('Error updating user data: $e');
      ShowSnackBar(message: "Error: $e");

      rethrow; // Re-throw the error to be caught by FutureBuilder
    }
  }

  ValueController(dynamic initialValue) {
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
    await AuthenticationRepository.instance.logout();
  }
}
