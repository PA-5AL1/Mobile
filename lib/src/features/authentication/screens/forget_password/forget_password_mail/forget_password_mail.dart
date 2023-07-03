import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/form/form_header_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: tDefaultSize * 4),
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgetPasswordTitle,
                  heightBetween: 30.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                Text(
                  tForgetPasswordText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          labelText: tEmail,
                          hintText: tEmailHint,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: tDefaultSize),
                     SizedBox(
                       width: double.infinity,
                        child: ElevatedButton (
                          onPressed: () => {
                            controller.sendPasswordResetEmail( controller.email.text.trim(),),
                            // Get.to(() => const OTPScreen())
                            if(controller.email.text.trim() != "")
                            {
                              Get.to(() => const LoginScreen())
                            }
                          },
                          child: const Text(tSend),
                        ),
                     ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}