import 'package:flutter/material.dart';
import 'package:jammybread/modules/authentication/view/login.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: AppRouter.routers,
      // initialRoute: NavBar.routeName,
      home: const WelcomeScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
