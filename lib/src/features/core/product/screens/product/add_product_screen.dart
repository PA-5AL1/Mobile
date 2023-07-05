import 'package:cached_network_image/cached_network_image.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/category.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/storage_product_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/product_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/storage_product_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/products_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/widgets/form_row.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/internet_connection_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantity_input/quantity_input.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String categoryValue = Category.CATEGORIES.first;
  int quantityValue = 1;
  DateTime expirationDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final storageProductController = Get.put(StorageProductController());
    final formKey = GlobalKey<FormState>();

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
                  key: formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: tBlack,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: widget.product.image,
                        ),
                        const SizedBox(height: tFormHeight),
                        FormRow(
                          label: tName,
                          formField: Flexible(
                            child: Text(widget.product.name),
                          ),
                        ),
                        const SizedBox(height: tFormHeight / 2),
                        FormRow(
                          label: tBrand,
                          formField: Flexible(
                            child: Text(widget.product.brand),
                          ),
                        ),
                        const SizedBox(height: tFormHeight / 2),
                        FormRow(
                          label: tCategory,
                          formField: DropdownButton<String>(
                            value: categoryValue,
                            hint: const Text(tCategory),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                categoryValue = value!;
                              });
                            },
                            items: Category.CATEGORIES
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: tFormHeight / 2),
                        FormRow(
                          label: tQuantity,
                          formField: QuantityInput(
                              acceptsNegatives: false,
                              value: quantityValue,
                              onChanged: (value) => setState(() =>
                                  quantityValue =
                                      int.parse(value.replaceAll(',', '')))),
                        ),
                        const SizedBox(height: tFormHeight),
                        InputDatePickerFormField(
                          fieldLabelText: tExpiryDate,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          onDateSubmitted: (value) => {
                            setState(() {
                              expirationDate = value;
                            })
                          },
                        ),
                        const SizedBox(height: tFormHeight / 2),
                        FormRow(
                          label: tBarcode,
                          formField: Text(widget.product.barcode),
                        ),
                        const SizedBox(height: tFormHeight),
                        SizedBox(
                          child: IconButton(
                            color: tRedCroixRougeColor,
                            iconSize: 40,
                            icon: const Icon(tAddIcon),
                            onPressed: () async {
                              await InternetConnectionService.checkConnection(
                                context,
                              );

                              await storageProductController.addProduct(
                                StorageProductModel(
                                  barcode: widget.product.barcode,
                                  name: widget.product.name,
                                  brand: widget.product.brand,
                                  image: widget.product.image,
                                  quantity: quantityValue,
                                  expirationDate: expirationDate,
                                  category: categoryValue,
                                ),
                              );

                              Get.to(() =>
                                  ProductsScreen(category: categoryValue));
                            },
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
