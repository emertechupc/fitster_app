import 'dart:convert';

class FavoriteModel {
  int? id;
  int? productId;
  String? image;
  String? name;
  double? price;
  double? rating;
  String? src3dModel;
  int userId;

  FavoriteModel({
    this.id,
    this.productId,
    this.image,
    this.name,
    this.price,
    this.rating,
    this.src3dModel,
    required this.userId,
  });

  FavoriteModel copyWith({
    int? id,
    int? productId,
    String? image,
    String? name,
    double? price,
    double? rating,
    String? src3dModel,
    int? userId,
  }) =>
      FavoriteModel(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        src3dModel: src3dModel ?? this.src3dModel,
        userId: userId ?? this.userId,
      );

  factory FavoriteModel.fromJson(String str) =>
      FavoriteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        id: json['id'],
        productId: json['productId'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        src3dModel: json['src3dModel'],
        userId: json['userId'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'image': image,
        'name': name,
        'price': price,
        'rating': rating,
        'src3dModel': src3dModel,
        'userId': userId,
      };
}
