class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String supplierId;
  final int stockQuantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.supplierId,
    required this.stockQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        supplierId: json['supplierId'],
        stockQuantity: json['stockQuantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'price': price,
        'imageUrl': imageUrl,
        'supplierId': supplierId,
        'stockQuantity': stockQuantity,
      };
}
