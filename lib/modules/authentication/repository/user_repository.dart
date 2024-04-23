import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user, bool isLoading) async {
   await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() =>  ShowSnackBar(
            message: 'Success: Your account has been created'))
        .catchError((error, stackTrace) {
      ShowSnackBar(message: 'Error: Something went wromt. Try again.');
      print(error.toString());
    });
  }
}
