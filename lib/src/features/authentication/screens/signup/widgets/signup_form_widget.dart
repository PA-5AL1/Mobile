import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(tUserIcon),
                labelText: tEmail,
                hintText: tEmailHint,
              ),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(tFingerPrintIcon),
                labelText: tPassword,
                hintText: tPasswordHint,
                suffixIcon: Icon(tPasswordShowIcon),
              ),
            ),
            const SizedBox(height: tFormHeight + 5),
            SizedBox(
              width: double.infinity,
              height: tFormSubmit,
              child: ElevatedButton.icon(
                icon: const Icon(tSignUpIcon),
                onPressed: () => {
                  if (formKey.currentState!.validate())
                    {
                      controller.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                      )
                    }
                },
                label: const Text(tSignUpButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
