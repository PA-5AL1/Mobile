import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/controllers/product_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(tArrowLeftIcon),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tProduct,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: tFormHeight * 2),
                Form(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          product.image,
                          scale: 2,
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: tEmail,
                            hintText: tEmailHint,
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          controller: controller.quantity,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Quantité',
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            color: tRedCroixRougeColor,
                            iconSize: 35,
                            icon: const Icon(tAddIcon),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
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
