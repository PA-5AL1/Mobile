import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/product_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/add_product_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/services/bar_code_scanner_service.dart';
import 'package:get/get.dart';

class BarCodeScannerController extends GetxController {
  static BarCodeScannerController get instance => Get.find();
  final scannerService = Get.put(BarCodeScannerService());
  final productController = Get.put(ProductController());

  Future<String> scanBarcode() async {
    String barcode = await scannerService.scan();
    var productFromAPI = await productController.getProductFromBarcode(barcode);
    Get.to(
      () => AddProductScreen(product: productFromAPI),
    );
    return barcode;
  }
}
