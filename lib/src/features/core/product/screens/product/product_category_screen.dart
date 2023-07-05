import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/category.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/barcode_scanner_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/widgets/card_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barCodeController = Get.put(BarCodeScannerController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      tProductTables,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: barCodeController.scanBarcode,
                        icon: const Icon(
                          tAddIcon,
                          color: tRedCroixRougeColor,
                          size: 30,
                        ),
                      ),
                      const Text(tAddProduct)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: tDefaultSize),
              const Divider(thickness: 1),
              const SizedBox(height: tDefaultSize),
              const CardRow(
                firstCardCategory: Category.ALIMENTARY,
                firstCardImage: tAlimentaryImage,
                secondCardCategory: Category.FIRST_AID,
                secondCardImage: tFirstAidImage,
              ),
              const CardRow(
                firstCardCategory: Category.HYGIENE,
                firstCardImage: tHygieneImage,
                secondCardCategory: Category.LOGISTIC,
                secondCardImage: tLogisticImage,
              ),
              const CardRow(
                firstCardCategory: Category.DIY_TOOLS,
                firstCardImage: tDIYToolImage,
                secondCardCategory: Category.UNIFORM,
                secondCardImage: tUniformImage,
              ),
              const CardRow(
                firstCardCategory: Category.TRAINING_TOOLS,
                firstCardImage: tTrainingToolImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
