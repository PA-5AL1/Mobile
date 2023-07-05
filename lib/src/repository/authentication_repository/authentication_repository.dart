import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/home/home_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/login_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'exceptions/login_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.offAll(() => const LoginScreen());
      return '';
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      return ex.message;
    }
  }

  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return '';
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      return ex.message;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> resetPasswordByMail(String email) async {
    try {
      await FirebaseAuth.instance.setLanguageCode("fr");
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('EXCEPTION - $e');
    }
  }

  Future<void> passwordReset(String otp, String newPassword) async {
    try {
      await _auth.confirmPasswordReset(code: otp, newPassword: newPassword);
    } catch (e) {
      print('EXCEPTION - $e');
    }
  }

  Future<UserModel> currentUser() async {
    var user = _auth.currentUser;
    return UserModel(
        id: user?.uid ?? '', email: user?.email ?? '', password: '');
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      _auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print('EXCEPTION - $e');
    }
  }

  Future<void> removeUser() async {
    try {
      _auth.currentUser?.delete();
    } catch (e) {
      print('EXCEPTION - $e');
    }
  }
}
