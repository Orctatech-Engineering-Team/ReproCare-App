class OrderModel {
  final String id;
  final String customerId;
  final String supplierId;
  final String productId;
  final int quantity;
  final double totalPrice;
  final String status; // pending, approved, shipped, delivered

  OrderModel({
    required this.id,
    required this.customerId,
    required this.supplierId,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        customerId: json['customerId'],
        supplierId: json['supplierId'],
        productId: json['productId'],
        quantity: json['quantity'],
        totalPrice: json['totalPrice'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'supplierId': supplierId,
        'productId': productId,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'status': status,
      };
}
