import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoadingResultWidget extends StatelessWidget {
  const LoadingResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: tDefaultSize),
            Center(
              child: Text(tLoadingResult),
            ),
          ]),
    );
  }
}
