import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:flutter/material.dart';

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
