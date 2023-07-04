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
                          color: tBlack,
                          width: 2,
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
                          initialValue: product.name,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Nom',
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
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
                            labelText: 'Quantité',
                            hintText: '0',
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          initialValue: product.barcode,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Code barre',
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        SizedBox(
                          width: 40,
                          height: 40,
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
