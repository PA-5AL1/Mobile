class StorageProductModel {
  final String barcode;
  final String name;
  final String brand;
  final String image;
  final int quantity;
  final DateTime expirationDate;
  final String category;

  const StorageProductModel({
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
        category: json['category']
    );
  }
}