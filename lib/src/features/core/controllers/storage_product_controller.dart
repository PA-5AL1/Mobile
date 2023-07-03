import 'package:croix_rouge_storage_manager_mobile/src/constants/api_url.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/http_client_service.dart';
import 'package:get/get.dart';

class StorageProductController extends GetxController {
  static StorageProductController get instance => Get.find();
  HTTPClientService client = HTTPClientService(baseURL: APP_API);

  Future<void> addProduct(StorageProductModel) async {
    await client.post('product', StorageProductModel);
  }
}
