import 'dart:convert';

class FavoriteModel {
    int? id;
    int productId;
    String? image;
    String? name;
    double? price;
    double? rating;
    int userId;

    FavoriteModel({
        this.id,
        required this.productId,
        this.image,
        this.name,
        this.price,
        this.rating,
        required this.userId,
    });

    FavoriteModel copyWith({
        int? id,
        int? productId,
        String? image,
        String? name,
        double? price,
        double? rating,
        int? userId,
    }) => 
        FavoriteModel(
            id: id ?? this.id,
            productId: productId ?? this.productId,
            image: image ?? this.image,
            name: name ?? this.name,
            price: price ?? this.price,
            rating: rating ?? this.rating,
            userId: userId ?? this.userId,
        );

    factory FavoriteModel.fromJson(String str) => FavoriteModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        id: json['id'],
        productId: json['productId'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        userId: json['userId'],
    );

    Map<String, dynamic> toMap() => {
        'id': id,
        'productId': productId,
        'image': image,
        'name': name,
        'price': price,
        'rating': rating,
        'userId': userId,
    };
}
