import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future <void> init() async {
    await Future.delayed(const Duration(milliseconds: 300));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 15)); // Change to 1800 for prod
    Get.to(const LoginScreen());
  }
}