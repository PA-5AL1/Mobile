import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_error_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final controller = Get.put(AuthenticationController());
  late Future<String> _email;

  @override
  initState() {
    super.initState();
    _email = retrieveCurrentUserEmail();
  }

  Future<String> retrieveCurrentUserEmail() async {
    var user = await controller.currentUser;
    return user.email;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(tArrowLeftIcon),
              ),
              title: const Text(tEditProfile),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize + 10),
                child: Column(
                  children: [
                    Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 4),
                        TextFormField(
                          initialValue: snapshot.data,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: tEmail,
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: tPassword,
                            hintText: tPasswordHint,
                            suffixIcon: Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                        const SizedBox(height: tDefaultSize + 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.updatePassword(
                                controller.password.text.trim(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tRedCroixRougeColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(tEditProfile),
                          ),
                        ),
                        const SizedBox(height: tDefaultSize * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: tJoined,
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: tJoinedAt,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: const StadiumBorder(),
                                side: BorderSide.none,
                              ),
                              child: const Text(tDelete),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const LoadingResultErrorWidget();
        } else {
          return const LoadingResultWidget();
        }
      },
    );
  }
}
