import 'package:flutter/material.dart';
import 'package:jammybread/modules/authentication/view/login.screen.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/modules/authentication/view/signup.screen.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/modules/discover/view/discover.dart';
import 'package:jammybread/modules/discover/view/discover.search.dart';
import 'package:jammybread/modules/home/view/home.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/modules/profile/view/edit.profile.screen.dart';
import 'package:jammybread/services/auth_gate.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routers = {
    // Dashboard
    NavBar.routeName: (context) => const NavBar(),
    HomeScreen.routeName: (context) => const HomeScreen(),

    // Authentication
    AuthGate.routeName:(context) => const AuthGate(),
    WelcomeScreen.routeName:(context) => const WelcomeScreen(),
    Login.routeName:(context) => const Login(),
    SignUp.routeName:(context)=> const SignUp(),
    PhoneVerification.routeName:(context) => const PhoneVerification(phoneNo: '',),
    // Onboarding

    // Discover
    Discover.routeName: (context) => const Discover(),
    // DiscoverSearch.routeName: (context) => const DiscoverSearch(),

    // Profile
    EditProfile.routeName:(context) => const EditProfile(),
  };
}
