import 'package:cloud_firestore/cloud_firestore.dart';

class StorageProductModel {
  final String? id;
  final String barcode;
  final String name;
  final String brand;
  final String image;
  final int quantity;
  final DateTime expirationDate;
  final String category;

  const StorageProductModel({
    this.id,
    required this.barcode,
    required this.name,
    required this.brand,
    required this.image,
    required this.quantity,
    required this.expirationDate,
    required this.category,
  });

  factory StorageProductModel.fromJson(Map<String, dynamic> json) {
    return StorageProductModel(
        barcode: json['barcode'],
        name: json['name'],
        brand: json['brands'],
        image: json['image_front_url'],
        quantity: json['quantity'],
        expirationDate: DateTime.parse(json['expiration_date']),
        category: json['category']);
  }

  factory StorageProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return StorageProductModel(
      id: document.id,
      barcode: data["barcode"],
      name: data["name"],
      brand: data["brand"],
      image: data["image"],
      quantity: data["quantity"],
      expirationDate: DateTime.parse(data["expirationDate"]),
      category: data["category"],
    );
  }

  toJson() {
    return {
      'barcode': barcode,
      'name': name,
      'brand': brand,
      'image': image,
      'quantity': quantity,
      'expirationDate': expirationDate.toString(),
      'category': category,
    };
  }
}
