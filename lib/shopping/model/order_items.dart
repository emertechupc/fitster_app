import 'dart:convert';

class OrderItem {
  int? id;
  int productId;
  int quantity;
  double subtotal;
  int orderId;

  OrderItem({
    this.id,
    required this.productId,
    required this.quantity,
    required this.subtotal,
    required this.orderId,
  });

  OrderItem copyWith({
    int? id,
    int? productId,
    int? quantity,
    double? subtotal,
    int? orderId,
  }) =>
      OrderItem(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        subtotal: subtotal ?? this.subtotal,
        orderId: orderId ?? this.orderId,
      );

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json['id'],
        productId: json['productId'],
        quantity: json['quantity'],
        subtotal: json['subtotal'],
        orderId: json['orderId'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'quantity': quantity,
        'subtotal': subtotal,
        'orderId': orderId,
      };
}
