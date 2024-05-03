import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/utilities/helpers.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user, bool isLoading) async {
    try {
      await _db.collection("Users").add(user.toJson()).then((result) {
        Helpers().showSnackBar('Success: Your account has been created');
      });
    } catch (e) {
       Helpers().showSnackBar('Error: Something went wrong. Try again.');
      debugPrint(e.toString());
      throw Exception('Failed to create user');
    }
  }

  // Future<UserModel> getUserDetails(String email) async {
  //   final snapshot =
  //       await _db.collection("Users").where("Email", isEqualTo: email).get();
  //   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  //   return userData;
  // }
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    if (snapshot.docs.isEmpty) {
      throw Exception('No user found for that email');
    }
    return UserModel.fromSnapshot(snapshot.docs.first);
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    debugPrint("THE IDDDDDD${user.id}");

    await _db.collection("Users").doc(user.id). update(user.toJson());
  }
   Future<void> deleteUserRecord(UserModel user) async {
    debugPrint("THE IDDDDDD${user.id}");

    await _db.collection("Users").doc(user.id).delete();
  }

  Future<void> deleteUserFromFirestore(String userId) async {
  
  try {
    await _db.collection('users').doc(userId).delete();
    debugPrint("User data deleted from Firestore");
   

  } catch (e) {
    debugPrint("Error deleting user data from Firestore: $e");
    Helpers().showSnackBar("Error deleting user data from Database: $e");

    throw Exception('Failed to delete user data.');
  }
}

}
