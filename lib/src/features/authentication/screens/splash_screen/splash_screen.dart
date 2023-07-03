import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.init();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 100,
              left: splashController.animate.value
                  ? MediaQuery.of(context).size.width / 4
                  : -MediaQuery.of(context).size.width,
              child: Text(tOrganizationName,
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 180,
              left: splashController.animate.value
                  ? MediaQuery.of(context).size.width / 4
                  : -MediaQuery.of(context).size.width,
              child: Text(
                tOrganizationCity,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                top: 250,
                right: splashController.animate.value
                    ? 0
                    : -MediaQuery.of(context).size.width,
                child: Image(
                    image: const AssetImage(tSplashScreenIcon),
                    width: MediaQuery.of(context).size.width)),
          ),
          const Positioned(
              bottom: 150,
              child: CircularProgressIndicator(
                color: tRedCroixRougeColor,
              )),
          Positioned(
            bottom: 50,
            child:
                Text(tCopyRight, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
