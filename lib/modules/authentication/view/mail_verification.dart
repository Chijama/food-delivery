import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/controller/mail_verification_controller.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/textstyles.dart';

class MailVerification extends StatelessWidget {
  static const String routeName = '/mail-verification';

  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(), // Back button to previous screen
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            const Icon(Icons.email_outlined,
                size: 80, color: Colors.black), // Icon at the top
            const SizedBox(height: 48),
            Text(
              'Verify your email address',
              textAlign: TextAlign.center,
              style:
                  blackWeight500size22().copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'We have just sent an email verification link to your email. '
              'Please check your email and click on that link to verify your email address.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () => controller.manuallyCheckEmailVerificationStatus,
                child: Text('Continue', style: blackWeight400size14()),
              ),
            ),

            TextButton(
              onPressed: () =>controller.sendVerificationEmail(),
              child: const Text(
                'Resend E-Mail Link',
                style: TextStyle(
                    decoration: TextDecoration.underline, color: blue120),
              ),
            ),
            TextButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              child: const Text(
                'Back to Login',
                style: TextStyle(color: blue120),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
