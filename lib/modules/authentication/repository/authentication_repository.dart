import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/view/welcome.screen.dart';
import 'package:jammybread/modules/home/view/nav.bar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
//Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll
  (() => const NavBar());
  }

  
}

