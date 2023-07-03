import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());

    return Scaffold(
        // appBar: AppBar(
        //   leading: const Icon(Icons.warehouse_outlined),
        //   title: const Text(tHomeTitle),
        //   centerTitle: true,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         controller.logoutUser();
        //       },
        //       icon: const Icon(Icons.logout),
        //     )
        //   ],
        // ),
        body: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(tDefaultSize),
                child: Image(image: AssetImage(tHomeImage)),
              ),
              Padding(
                padding: const EdgeInsets.all(tDefaultSize * 2),
                child: Text(tHomeText,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ],
          ),
        ),
      );
  }
}
