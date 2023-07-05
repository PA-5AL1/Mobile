import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class InternetConnectionService {
  static Future<void> checkConnection(BuildContext context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 500),
            content: Center(child: Text(tNoInternetConnection)),
          ),
        );
      }
    }
  }
}
