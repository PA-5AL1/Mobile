import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
    required this.richText,
    required this.richTextButton,
    required this.routeTo,
  });

  final String richText, richTextButton;
  final StatelessWidget routeTo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: tFormHeight),
          TextButton(
            onPressed: () => {Get.to(routeTo)},
            child: Text.rich(
              TextSpan(
                text: richText,
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: richTextButton,
                    style: const TextStyle(
                      color: tRedCroixRougeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
