import 'package:flutter/material.dart';
import 'package:jammybread/modules/home/view/home.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routers = {
    // Dashboard
    NavBar.routeName: (context) => const NavBar(),
    HomeScreen.routeName: (context) => const HomeScreen(),

    // Authentication

    // Onboarding
  };
}
