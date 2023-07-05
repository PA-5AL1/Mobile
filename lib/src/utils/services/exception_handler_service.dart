import 'package:flutter/material.dart';

class ExceptionHandlerService {
  static void handleError(String error, BuildContext context) {
    if (error != '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 500),
          content: Center(child: Text(error)),
        ),
      );
    }
  }
}
