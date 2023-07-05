import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarCodeScannerService extends GetxController {
  static BarCodeScannerService get instance => Get.find();

  Future<String> scan() async {
    try {
      return await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      throw 'Failed to get platform version.';
    }
  }
}
