import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    super.key,
    required this.cardTitle,
    required this.assetImage,
  });

  final String cardTitle;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductsScreen(category: cardTitle));
        },
        child: SizedBox(
          height: 200,
          width: 200,
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: Image.asset(
                      assetImage,
                    ),
                  ),
                  const SizedBox(height: tDefaultSize),
                  Flexible(
                    child: Text(
                      cardTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
