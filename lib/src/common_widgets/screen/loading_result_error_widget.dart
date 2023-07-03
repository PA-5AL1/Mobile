import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoadingResultErrorWidget extends StatelessWidget {
  const LoadingResultErrorWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(
          child: Icon(
            tErrorIcon,
            color: Colors.red,
            size: 60,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(tLoadingResultError),
        ),
      ]),
    );
  }
}
