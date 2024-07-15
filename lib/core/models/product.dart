class Product {
  final String name;
  final String desc;
  final int categoryId;
  final String categoryName;
  final String brandName;
  final int brandId;
  final String image;
  final int productId;

  Product({
    required this.name,
    required this.desc,
    required this.categoryId,
    required this.categoryName,
    required this.brandName,
    required this.brandId,
    required this.image,
    required this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      desc: json['desc'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      brandName: json['brand_name'],
      brandId: json['brand_id'],
      image: json['image'] ?? '',
      productId: json['product_id'],
    );
  }

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}
