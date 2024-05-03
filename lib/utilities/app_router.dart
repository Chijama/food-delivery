import 'package:flutter/material.dart';
import 'package:jammybread/modules/authentication/view/login.screen.dart';
import 'package:jammybread/modules/authentication/view/mail_verification.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/modules/authentication/view/signup.screen.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/modules/discover/view/discover.dart';
import 'package:jammybread/modules/home/view/home.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/modules/onboarding/view/splash_screen.dart';
import 'package:jammybread/modules/profile/view/edit.profile.screen.dart';
import 'package:jammybread/modules/profile/view/profile.screen.dart';


class AppRouter {
  static Map<String, WidgetBuilder> routers = {
    // Dashboard
    NavBar.routeName: (context) => const NavBar(),
    HomeScreen.routeName: (context) => const HomeScreen(),

    // Authentication
    
    WelcomeScreen.routeName:(context) => const WelcomeScreen(),
    Login.routeName:(context) => const Login(),
    SignUp.routeName:(context)=> const SignUp(),
    PhoneVerification.routeName:(context) => const PhoneVerification(phoneNo: '',),
    MailVerification.routeName:(context)=>  const MailVerification(),
    // Onboarding
SplashScreen.routeName:(context) => SplashScreen(),
    // Discover
    Discover.routeName: (context) => const Discover(),
    // DiscoverSearch.routeName: (context) => const DiscoverSearch(),

    // Profile
    Profile.routeName:(context) => const Profile(),
    EditProfile.routeName:(context) => const EditProfile(),
  };
}
