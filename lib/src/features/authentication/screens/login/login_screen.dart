import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/form/form_footer_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/form/form_header_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  image: tTitleImage,
                  title: tLogin,
                ),
                LoginForm(),
                FormFooterWidget(
                  richText: tDontHaveAnAccount,
                  richTextButton: tSignUp,
                  routeTo: SignUpScreen(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
