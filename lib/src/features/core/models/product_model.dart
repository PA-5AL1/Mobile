class ProductModel {
  final String barcode;
  final String name;
  final String brand;
  final String image;
  final int? quantity;
  final DateTime? expirationDate;
  final String? category;

  const ProductModel({
    required this.barcode,
    required this.name,
    required this.brand,
    required this.image,
    this.quantity = 1,
    this.expirationDate,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        barcode: json['code'],
        name: json['product']['product_name'],
        brand: json['product']['brands'],
        image: json['product']['image_front_url']
    );
  }
}