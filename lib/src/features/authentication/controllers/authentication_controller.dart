import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/authentication_repository/authentication_repository.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<String> registerUser(String email, String password) async {
    var errorMessage = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    UserRepository.instance
        .createUser(UserModel(email: email, password: password, role: 'user'));
    return errorMessage;
  }

  Future<String> loginUser(String email, String password) async {
    return await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }

  void logoutUser() {
    AuthenticationRepository.instance.logout();
  }

  void sendPasswordResetEmail(String email) async {
    AuthenticationRepository.instance.resetPasswordByMail(email);
  }

  void changePassword(String otp, String newPassword) async {
    AuthenticationRepository.instance.passwordReset(otp, newPassword);
  }

  void updatePassword(String newPassword) async {
    AuthenticationRepository.instance.updatePassword(newPassword);
  }

  Future<UserModel> get currentUser async =>
      await AuthenticationRepository.instance.currentUser();
}
