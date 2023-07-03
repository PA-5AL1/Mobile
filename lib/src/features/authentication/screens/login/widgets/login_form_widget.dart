import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final formKey = GlobalKey<FormState>();
    bool passwordVisible = true;

    @override
    void initState() {
      super.initState();
      passwordVisible = true;
    }

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 5),
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
              obscureText: passwordVisible,
              decoration: InputDecoration(
                prefixIcon: const Icon(tFingerPrintIcon),
                labelText: tPassword,
                hintText: tPasswordHint,
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? tPasswordHideIcon : tPasswordShowIcon,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () =>
                    {Get.to(() => const ForgetPasswordMailScreen())},
                child: const Text(tForgetPassword),
              ),
            ),
            const SizedBox(height: tFormHeight),
            SizedBox(
              width: double.infinity,
              height: tFormSubmit,
              child: ElevatedButton.icon(
                icon: const Icon(tLoginIcon),
                onPressed: () => {
                  controller.loginUser(
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                  )
                },
                label: const Text(tLoginButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
