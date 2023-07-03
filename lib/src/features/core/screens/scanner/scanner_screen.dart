import 'package:croix_rouge_storage_manager_mobile/httpClient.dart';
import 'package:croix_rouge_storage_manager_mobile/product.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/api_url.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});
  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcodeResult = '8002270000218';
  Product ?_result;
  HTTPClient client = HTTPClient();

  void getProductFromBarcode() async {
    final response = await client.get(API + _scanBarcodeResult);
    print(response);
    setState(() {
      _result = Product.fromJson(response.data);
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      //debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes;
      getProductFromBarcode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tScanner),
      ),
      body: Builder (
        builder: (context) => Container(
          alignment: Alignment.center,
          child: Flex (
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(onPressed: scanBarcodeNormal, child: const Text('Start barcode scan')),
              Text('Barcode : $_scanBarcodeResult\n',
                  style: const TextStyle(fontSize: 20),
                ),
              Text('Result: $_result.name\n',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      )
    );
  }
}