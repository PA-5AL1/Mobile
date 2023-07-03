import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =  InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: tSecondaryColor,
    floatingLabelStyle: const TextStyle(color: tSecondaryColor),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: tSecondaryColor, width: 2.0),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    labelStyle: const TextStyle(color: tWhiteColor),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: tWhiteColor,
    floatingLabelStyle: const TextStyle(color: tWhiteColor),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: tWhiteColor, width: 2.0),
    ),
  );
}