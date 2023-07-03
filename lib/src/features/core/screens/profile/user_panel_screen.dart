import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_error_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPanelScreen extends StatefulWidget {
  const UserPanelScreen({Key? key}) : super(key: key);

  @override
  State<UserPanelScreen> createState() => _UserPanelScreenState();
}

class _UserPanelScreenState extends State<UserPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(tArrowLeftIcon),
        ),
        title: const Text(tUsersPanel),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: FutureBuilder<List<UserModel>>(
          future: controller.getUsers(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if(snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(tNoUsers),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      final item = snapshot.data![index];
                      return Dismissible(
                        key: Key(item.id.toString()),
                        confirmDismiss: (direction) {
                          return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(tDialogRemoveTitle),
                                content: const Text(tDialogRemoveTextUser),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(tDelete)),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text(tCancel),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onDismissed: (direction) {
                          setState(() {
                            controller.fakeUsers.removeAt(index);
                            controller.removeUser(item.id!);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text(
                                  'L\'utilisateur ${item.email} a été supprimé'),
                            ),
                          );
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  side:
                                      const BorderSide(color: tBlack, width: 1),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                iconColor: tBlack,
                                tileColor: tRedCroixRougeColor.withOpacity(0.1),
                                leading: const Icon(tUserIcon),
                                title: Text(
                                    'Email: ${snapshot.data![index].email}'),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return const LoadingResultErrorWidget();
              } else {
                return const LoadingResultErrorWidget();
              }
            } else {
              return const LoadingResultWidget();
            }
          },
        ),
      ),
    );
  }
}
