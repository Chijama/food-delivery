import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user, bool isLoading) async {
     try {
      await _db.collection("Users").add(user.toJson()).then((result) {
        ShowSnackBar(message: 'Success: Your account has been created');
      });
    } catch (e) {
      ShowSnackBar(message: 'Error: Something went wrong. Try again.');
      print(e.toString());
      throw Exception('Failed to create user');
    }
  //  await _db
  //       .collection("Users")
  //       .add(user.toJson())
  //       .whenComplete(() =>  ShowSnackBar(
  //           message: 'Success: Your account has been created'))
  //       .catchError((error, stackTrace) {
  //     ShowSnackBar(message: 'Error: Something went wromt. Try again.');
  //     print(error.toString());
  //   });
  }
}
