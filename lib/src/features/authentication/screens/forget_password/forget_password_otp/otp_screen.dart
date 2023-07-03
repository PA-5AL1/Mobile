import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    String _otp = '';

    setOtp(String code) {
      setState(() {
        _otp = code;
      });
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: tDefaultSize * 2),
            const Text(
              '$tOtpMessage fakemail@gmail.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: tDefaultSize),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  setOtp(code);
                  print('OTP is => $code');
                }),
            const SizedBox(height: tDefaultSize),
            Form(
              child: TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  labelText: tNewPassword,
                  hintText: tNewPassword,
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
            ),
            const SizedBox(height: tDefaultSize),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.changePassword(_otp, controller.password.text.trim());
                  },
                  child: const Text(tNext)),
            ),
          ],
        ),
      ),
    );
  }
}
