import "package:get/get.dart";
import "package:jammybread/modules/authentication/view/mail_verification.dart";
import "package:jammybread/repository/authentication_repository.dart";
import "package:jammybread/utilities/helpers.dart";

class MailVerificationController extends GetxController {
  

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
    Get.toNamed(MailVerification.routeName);
  }

  /// Set Timer to check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {}

  ///-- Manually Check if Verification Completed then Redirect void manuallyCheckEmailVerificationStatus(){}
}
