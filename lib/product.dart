class Product {
  final String code;
  final String name;
  final String brand;
  final String image;
  final int? quantity;
  final DateTime? expirationDate;
  final String? category;

  const Product({
    required this.code,
    required this.name,
    required this.brand,
    required this.image,
    this.quantity = 1,
    this.expirationDate,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['code'],
      name: json['product']['product_name'],
      brand: json['product']['brands'],
      image: json['product']['image_front_url']
    );
  }
}