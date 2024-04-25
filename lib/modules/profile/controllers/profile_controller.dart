import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/repository/authentication_repository.dart';
import 'package:jammybread/modules/authentication/repository/user_repository.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  RxBool isDisabled = true.obs;
  
  // Data from TextFields
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      const ShowSnackBar(message: "Error: Login to continue");
    }
  }
    void onChanged(String value) {
    if (value.isEmpty) {
      isDisabled(true);
    } else {
      isDisabled(false);
    }
  }
    void logOut() async {
    await AuthenticationRepository.instance.logout();
    
  }
}
 