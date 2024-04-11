import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jammybread/modules/authentication/view/signup_email_password_failure.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class AuthService {
// get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
      showSnackBar(context, e.toString());
      throw Exception(e.code);
    }
  }

  // email sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password, BuildContext context) async {
    //try sign user up

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }

    //  catch any errors
    on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showSnackBar(context, ex.message);
      throw Exception(e.code);
    }
  }

  // email sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
