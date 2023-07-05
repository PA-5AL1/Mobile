import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/widgets/clickable_card.dart';
import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  const CardRow({
    super.key,
    required this.firstCardCategory,
    required this.firstCardImage,
    this.secondCardCategory,
    this.secondCardImage,
  });

  final String firstCardCategory;
  final String firstCardImage;
  final String? secondCardCategory;
  final String? secondCardImage;

  @override
  Widget build(BuildContext context) {
    if (secondCardCategory != null && secondCardImage != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClickableCard(
            cardTitle: firstCardCategory,
            assetImage: firstCardImage,
          ),
          ClickableCard(
            cardTitle: secondCardCategory!,
            assetImage: secondCardImage!,
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClickableCard(
          cardTitle: firstCardCategory,
          assetImage: firstCardImage,
        ),
      ],
    );
  }
}
