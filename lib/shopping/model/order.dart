import 'dart:convert';

class Order {
  int? id;
  int userId;
  int total;
  DateTime orderDate;

  Order({
    this.id,
    required this.userId,
    required this.total,
    required this.orderDate,
  });

  Order copyWith({
    int? id,
    int? userId,
    int? total,
    DateTime? orderDate,
  }) =>
      Order(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        total: total ?? this.total,
        orderDate: orderDate ?? this.orderDate,
      );

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        total: json['total'],
        orderDate: DateTime.parse(json['orderDate']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'total': total,
        'orderDate': orderDate.toIso8601String(),
      };
}
