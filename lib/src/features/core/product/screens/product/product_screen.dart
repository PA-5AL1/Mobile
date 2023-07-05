import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/storage_product_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/storage_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final StorageProductModel product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageProductController = Get.put(StorageProductController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(tArrowLeftIcon),
          onPressed: () => Get.back(),
        ),
        title: Text(product.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
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
                  Image.network(product.image),
                  const SizedBox(height: tDefaultSize),
                  Text(product.name),
                  const SizedBox(height: tDefaultSize / 2),
                  Text(product.brand),
                  const SizedBox(height: tDefaultSize / 2),
                  Text(product.category),
                  const SizedBox(height: tDefaultSize / 2),
                  Text(product.quantity.toString()),
                  const SizedBox(height: tDefaultSize / 2),
                  Text(product.expirationDate.toString()),
                  IconButton(
                      onPressed: () {
                        storageProductController.deleteProduct(product.barcode);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Center(
                              child: Text(tSnackBarRemoveProduct),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        tDeleteicon,
                        color: tRedCroixRougeColor,
                        size: 40,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
