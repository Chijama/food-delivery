import 'package:flutter/material.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';
import 'package:jammybread/utilities/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouter.routers,
      initialRoute: NavBar.routeName,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
