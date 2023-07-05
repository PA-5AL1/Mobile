import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/exception_handler_service.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/internet_connection_service.dart';
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
  bool hidePassword = true;

  togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final formKey = GlobalKey<FormState>();

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
              obscureText: hidePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(tFingerPrintIcon),
                labelText: tPassword,
                hintText: tPasswordHint,
                suffixIcon: IconButton(
                  icon: hidePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.remove_red_eye_sharp),
                  onPressed: () {
                    togglePassword();
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
                onPressed: () async {
                  await InternetConnectionService.checkConnection(context);

                  var email = controller.email.text.trim();
                  var password = controller.password.text.trim();

                  if (context.mounted) {
                    if (email == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Center(
                            child: Text(tEmailCantBeEmpty),
                          ),
                        ),
                      );
                      return;
                    }

                    if (password == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Center(
                            child: Text(tPasswordCantBeEmpt),
                          ),
                        ),
                      );
                      return;
                    }
                  }
                  var error = await controller.loginUser(
                    email,
                    password,
                  );
                  if (context.mounted) {
                    ExceptionHandlerService.handleError(error, context);
                  }
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
