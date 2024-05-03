import "dart:async";

import "package:firebase_auth/firebase_auth.dart";
import "package:get/get.dart";
import "package:jammybread/modules/authentication/view/mail_verification.dart";
import "package:jammybread/repository/authentication_repository.dart";
import "package:jammybread/utilities/helpers.dart";

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  /// Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Helpers().showSnackBar('Ooops: ${e.toString()}');
    }
    // Get.toNamed(MailVerification.routeName);
  }

  /// Set Timer to check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }

  ///-- Manually Check if Verification Completed then Redirect
  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      AuthenticationRepository.instance.setInitialScreen(user);
    } else {
      Helpers().showSnackBar('Verify Email Address');
    }
  }
}
