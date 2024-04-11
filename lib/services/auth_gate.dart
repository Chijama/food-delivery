import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';

class AuthGate extends StatelessWidget {
  static const String routeName = '/auth-gate';

  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot. hasData) {
              return const NavBar();
            }
            // user is NOT logged in
            else {
              return const WelcomeScreen();
            }
          }),
    );
  }
}
