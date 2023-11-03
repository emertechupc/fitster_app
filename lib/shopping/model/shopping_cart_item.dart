import 'dart:convert';

class ShoppingCartItem {
  int? id;
  int quantity;
  int productId;
  int shoppingCartId;

  ShoppingCartItem({
    this.id,
    required this.quantity,
    required this.productId,
    required this.shoppingCartId,
  });

  ShoppingCartItem copyWith({
    int? id,
    int? quantity,
    int? productId,
    int? shoppingCartId,
  }) =>
      ShoppingCartItem(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        productId: productId ?? this.productId,
        shoppingCartId: shoppingCartId ?? this.shoppingCartId,
      );

  factory ShoppingCartItem.fromJson(String str) =>
      ShoppingCartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCartItem.fromMap(Map<String, dynamic> json) =>
      ShoppingCartItem(
        id: json['id'],
        quantity: json['quantity'],
        productId: json['productId'],
        shoppingCartId: json['shoppingCartId'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'quantity': quantity,
        'productId': productId,
        'shoppingCartId': shoppingCartId,
      };
}
