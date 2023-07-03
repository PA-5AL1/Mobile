import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/icon_theme.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/snack_bar_theme.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/text_field_theme.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAPPTheme {

  TAPPTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFFE3001B,
      <int, Color>{
        50: Color(0xCDFF001E),
        100: Color(0xFFFF001E),
        200: Color(0xFFF3001E),
        300: Color(0xFFEE011F),
        400: Color(0xFFE7001D),
        500: Color(0xFFE3001B),
        600: Color(0xFFAB0017),
        700: Color(0xFF960016),
        800: Color(0xFF640007),
        900: Color(0xFF490005),
      },
    ),
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    iconTheme: TIconTheme.lightIconTheme,
    snackBarTheme: TSnackBarTheme.lightSnackBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: const MaterialColor(
      0xFFE3001B,
      <int, Color>{
        50: Color(0xCDFF001E),
        100: Color(0xFFFF001E),
        200: Color(0xFFF3001E),
        300: Color(0xFFEE011F),
        400: Color(0xFFE7001D),
        500: Color(0xFFE3001B),
        600: Color(0xFFAB0017),
        700: Color(0xFF960016),
        800: Color(0xFF640007),
        900: Color(0xFF490005),
      },
    ),
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    iconTheme: TIconTheme.darkIconTheme,
    snackBarTheme: TSnackBarTheme.darkSnackBarTheme,
  );
}