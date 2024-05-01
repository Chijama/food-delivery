import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/signup_email_password_failure.dart';
import 'package:jammybread/modules/authentication/view/mail_verification.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/utilities/helpers.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
//Varibales
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => const NavBar())
            : Get.offAll(() => const MailVerification());
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => const NavBar())
          : Get.to(() => const WelcomeScreen());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);

      debugPrint('FIREBASE AUTH EXCEPTION - ${e.message}');

      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      debugPrint('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> phoneAuthentication(
    String phoneNumber,
  ) async {
    //try sign user up

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
          Helpers().showSnackBar(
              "Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}");
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == 'Invalid-phone-number') {
            Helpers()
                .showSnackBar('Failed to verify phone number: ${e.message}');
          } else {
            Helpers().showSnackBar('Error: Somthing went wrong. Try again');
          }
        },
      );
    }

    //  catch any errors
    on FirebaseAuthException catch (e) {
      Helpers().showSnackBar(e.code);
      throw Exception(e.code);
    }
  }

  // verify OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle the Firebase Auth exception
    } catch (_) {
      // Handle any other exceptions
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // Handle the Firebase Auth exception
      Helpers().showSnackBar(e.code);
      throw Exception(e.code);
    } catch (_) {
      // Handle any other exceptions
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
