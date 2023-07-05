import 'package:croix_rouge_storage_manager_mobile/src/constants/api_url.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/category.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/storage_product_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/product_repository/product_repository.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/services/http_client_service.dart';
import 'package:get/get.dart';

class StorageProductController extends GetxController {
  static StorageProductController get instance => Get.find();

  final ProductRepository _productRepository = Get.put(ProductRepository());
  HTTPClientService client = HTTPClientService(baseURL: APP_API);

  List<StorageProductModel> fakeProducts = List.generate(
    50,
    (index) => StorageProductModel(
      name: 'Product $index',
      quantity: index,
      expirationDate: DateTime.now(),
      category: Category.ALIMENTARY,
      barcode: 'Barcode $index',
      brand: 'Brand $index',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/1200px-Google_Images_2015_logo.svg.png',
    ),
  );

  Future<void> addProduct(StorageProductModel) async {
    await _productRepository.createProduct(StorageProductModel);
    // await client.post('product', StorageProductModel);
  }

  Future<List<StorageProductModel>> getProducts() async {
    return await _productRepository.getProducts();
    // final response = await client.get('product');
    // return (response.data as List)
    //     .map((e) => StorageProductModel.fromJson(e))
    //     .toList();
    // return fakeProducts;
  }

  Future<List<StorageProductModel>> getProductsByCategory(
      String category) async {
    return await _productRepository.getProductsByCategory(category);
    // final response = await client.get('product/category/$category');
    // return (response.data as List)
    //     .map((e) => StorageProductModel.fromJson(e))
    //     .toList();
    // return fakeProducts
    //     .where((element) => element.category == category)
    //     .toList();
  }

  Future<void> deleteProduct(String barcode) async {
    await _productRepository.removeProduct(barcode);
    // client.delete('product/$barcode');
    // fakeProducts.removeWhere((element) => element.barcode == barcode);
  }

  Future<StorageProductModel> getProduct(String barcode) async {
    return await _productRepository.getProduct(barcode);
    // final response = await client.get('product/$barcode');
    // return StorageProductModel.fromJson(response.data);
    // return fakeProducts.firstWhere((element) => element.barcode == barcode);
  }
}
