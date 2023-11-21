import 'dart:convert';

class CartItem {
  int? id;
  int? productId;
  String? image;
  String? name;
  double? price;
  int userId;
  String? size;
  int? quantity;

  CartItem({
    this.id,
    this.productId,
    this.image,
    this.name,
    this.price,
    required this.userId,
    this.size,
    this.quantity,
  });

  CartItem copyWith({
    int? id,
    int? productId,
    String? image,
    String? name,
    double? price,
    int? userId,
    String? size,
    int? quantity,
  }) =>
      CartItem(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        userId: userId ?? this.userId,
        size: size ?? this.size,
        quantity: quantity ?? this.quantity,
      );

  factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        productId: json['productId'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        userId: json['userId'],
        size: json['size'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'image': image,
        'name': name,
        'price': price,
        'userId': userId,
        'size': size,
        'quantity': quantity,
      };
}
