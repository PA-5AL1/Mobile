import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/storage_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createProduct(StorageProductModel productModel) async {
    await _db
        .collection("Products")
        .add(productModel.toJson())
        .whenComplete(
          () => Get.snackbar("Succès", "Le produit a été créé avec succès.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Erreur", "Une erreur est survenue.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<StorageProductModel> getProduct(String barcode) async {
    final snapshot = await _db
        .collection("Products")
        .where("barcode", isEqualTo: barcode)
        .get();
    return snapshot.docs
        .map((doc) => StorageProductModel.fromSnapshot(doc))
        .single;
  }

  Future<List<StorageProductModel>> getProducts() async {
    final snapshot = await _db.collection("Products").get();
    return snapshot.docs
        .map((doc) => StorageProductModel.fromSnapshot(doc))
        .toList();
  }

  Future<List<StorageProductModel>> getProductsByCategory(
      String category) async {
    final snapshot = await _db
        .collection("Products")
        .where("category", isEqualTo: category)
        .get();
    return snapshot.docs
        .map((doc) => StorageProductModel.fromSnapshot(doc))
        .toList();
  }

  Future<void> removeProduct(String id) async {
    await _db.collection("Products").doc(id).delete();
  }

  Future<void> updateProduct(String id, StorageProductModel product) async {
    await _db.collection("Products").doc(id).update(product.toJson());
  }
}
