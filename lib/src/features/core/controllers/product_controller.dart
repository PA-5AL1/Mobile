import 'package:croix_rouge_storage_manager_mobile/src/constants/api_url.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/models/product_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/http_client_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final image = TextEditingController();
  final name = TextEditingController();
  final brand = TextEditingController();
  final quantity = TextEditingController();
  final category = TextEditingController();
  final barcode = TextEditingController();
  final expirationDate = TextEditingController();

  HTTPClientService client = HTTPClientService(baseURL: PRODUCT_API);

  Future<ProductModel> getProductFromBarcode(String barcode) async {
    final response = await client.get(barcode);
    return ProductModel.fromJson(response.data);
  }
}
