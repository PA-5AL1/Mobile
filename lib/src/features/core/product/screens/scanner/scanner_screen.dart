import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/barcode_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});
  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcodeResult = '';

  @override
  Widget build(BuildContext context) {
    final barCodeController = Get.put(BarCodeScannerController());
    return Scaffold(
        body: Builder(
      builder: (context) => Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  _scanBarcodeResult = await barCodeController.scanBarcode();
                },
                child: const Text('Scan')),
            const SizedBox(height: tDefaultSize),
            Text(
              'Code barre : $_scanBarcodeResult\n',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
