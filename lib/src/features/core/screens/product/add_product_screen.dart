import 'package:cached_network_image/cached_network_image.dart';
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
          title: const Text(
            tProduct,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: tBlack,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: product.image,
                        ),
                        const SizedBox(height: tFormHeight),
                        FormRow(
                          label: tName,
                          formField: Flexible(
                            child: Text(product.name),
                          ),
                        ),
                        FormRow(
                          label: tBrand,
                          formField: Flexible(
                            child: Text(product.brand),
                          ),
                        ),
                        const SizedBox(height: tFormHeight / 2),
                        FormRow(
                          label: tCategory,
                          formField: DropdownButton(
                            hint: const Text(tCategory),
                            items: [
                              'Alimentaire',
                              'Hygiene',
                              'Test',
                              'Toto',
                              'Tata'
                            ]
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {},
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
                            labelText: tQuantity,
                            hintText: tQuantityHint,
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        FormRow(
                            label: tBarcode, formField: Text(product.barcode)),
                        const SizedBox(height: tFormHeight / 2),
                        const SizedBox(height: tFormHeight),
                        SizedBox(
                          child: IconButton(
                            color: tRedCroixRougeColor,
                            iconSize: 40,
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

class FormRow extends StatelessWidget {
  const FormRow({
    super.key,
    required this.label,
    required this.formField,
  });

  final String label;
  final Widget formField;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        '$label : ',
        style: const TextStyle(color: tSecondaryColor),
      ),
      formField,
    ]);
  }
}
