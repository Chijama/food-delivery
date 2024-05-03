import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/firebase_options.dart';
import 'package:jammybread/modules/onboarding/view/splash_screen.dart';
import 'package:jammybread/repository/authentication_repository.dart';
import 'package:jammybread/repository/user_repository.dart';
import 'package:jammybread/utilities/app_router.dart';
import 'package:jammybread/utilities/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository());
    Get.put(UserRepository());

  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: AppRouter.routers,
      initialRoute: SplashScreen.routeName,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
