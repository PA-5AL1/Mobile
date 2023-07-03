import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Succès", "Le compte a été créé avec succès.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Erreur", "Une erreur est survenue.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUser(String email) async {
    final snapshot = await _db.collection("Users").where("email", isEqualTo: email).get();
    return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).single;
  }

  Future<List<UserModel>> getUsers() async {
   final snapshot = await _db.collection("Users").get();
   return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
  }

  Future<void> removeUser(String id) async {
    await _db.collection("Users").doc(id).delete();
  }
}
