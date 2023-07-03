import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/form/form_footer_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/form/form_header_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/login_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  title: tSignUp,
                ),
                SignUpFormWidget(),
                FormFooterWidget(
                  richText: tAlreadyHaveAccount,
                  richTextButton: tLogin,
                  routeTo: LoginScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
