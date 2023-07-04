class ProductModel {
  final String barcode;
  final String name;
  final String brand;
  final String image;

  const ProductModel({
    required this.barcode,
    required this.name,
    required this.brand,
    required this.image,
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