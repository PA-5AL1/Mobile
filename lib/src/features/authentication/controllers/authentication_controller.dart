import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/authentication_repository/authentication_repository.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final UserRepository _userRepository = Get.put(UserRepository());
  final AuthenticationRepository _authenticationRepository =
      Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();

  Future<String> registerUser(String email, String password) async {
    var errorMessage = await _authenticationRepository
        .createUserWithEmailAndPassword(email, password);
    _userRepository
        .createUser(UserModel(email: email, password: password, role: 'user'));
    return errorMessage;
  }

  Future<String> loginUser(String email, String password) async {
    return await _authenticationRepository.loginWithEmailAndPassword(
        email, password);
  }

  Future<void> logoutUser() async {
    await _authenticationRepository.logout();
  }

  void sendPasswordResetEmail(String email) async {
    await _authenticationRepository.resetPasswordByMail(email);
  }

  void changePassword(String otp, String newPassword) async {
    await _authenticationRepository.passwordReset(otp, newPassword);
  }

  void updatePassword(String newPassword) async {
    await _authenticationRepository.updatePassword(newPassword);
  }

  Future<UserModel> get currentUser async =>
      await _authenticationRepository.currentUser();
}
