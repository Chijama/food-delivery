import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/signup_email_password_failure.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class AuthService {
// get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  // get current user
  User? getCurretnUser() {
    return _firebaseAuth.currentUser;
  }

  // email sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, password, BuildContext context) async {
    //try sign user in

    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //  catch any errors
    on FirebaseAuthException catch (e) {
      ShowSnackBar(message: e.toString());
      throw Exception(e.code);
    }
  }

  // email sign up
  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    //try sign user up

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }

    //  catch any errors
    on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      ShowSnackBar(message: ex.message);
      throw Exception(e.code);
    }
  }

  // phone number verification
  Future<void> phoneAuthentication(
    String phoneNumber,
  ) async {
    //try sign user up

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          ShowSnackBar(
              message:
                  "Phone number automatically verified and user signed in: ${_firebaseAuth.currentUser?.uid}");
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == 'Invalid-phone-number') {
            ShowSnackBar(
                message: 'Failed to verify phone number: ${e.message}');
          } else {
            const ShowSnackBar(
                message: 'Error: Somthing went wrong. Try again');
          }
        },
      );
    }

    //  catch any errors
    on FirebaseAuthException catch (e) {
      ShowSnackBar(message: e.code);
      throw Exception(e.code);
    }
  }

  // verify OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  // email sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
