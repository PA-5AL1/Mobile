import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TSnackBarTheme {
  TSnackBarTheme._();

  static final lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: tBlack.withOpacity(0.8),
  );

  static final darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: tWhiteColor.withOpacity(0.8),
  );
}