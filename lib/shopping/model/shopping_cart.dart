import 'dart:convert';

class ShoppingCart {
  int? id;
  int userId;

  ShoppingCart({
    this.id,
    required this.userId,
  });

  ShoppingCart copyWith({
    int? id,
    int? userId,
  }) =>
      ShoppingCart(
        id: id ?? this.id,
        userId: userId ?? this.userId,
      );

  factory ShoppingCart.fromJson(String str) =>
      ShoppingCart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCart.fromMap(Map<String, dynamic> json) => ShoppingCart(
        id: json['id'],
        userId: json['userId'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
      };
}
