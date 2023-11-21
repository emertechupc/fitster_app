import 'dart:convert';

class Product {
    int? id;
    String name;
    String? description;
    double rating;
    int? categoryId;
    int? genderId;
    int? brandId;
    String? size;
    double price;
    String image;
    int? stock;
    String? model3D;

    Product({
        this.id,
        required this.name,
        this.description,
        required this.rating,
        this.categoryId,
        this.genderId,
        this.brandId,
        this.size,
        required this.price,
        required this.image,
        this.stock,
        this.model3D,
    });

    Product copyWith({
        int? id,
        String? name,
        String? description,
        double? rating,
        int? categoryId,
        int? genderId,
        int? brandId,
        String? size,
        double? price,
        String? image,
        int? stock,
        String? model3D,
    }) => 
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            rating: rating ?? this.rating,
            categoryId: categoryId ?? this.categoryId,
            genderId: genderId ?? this.genderId,
            brandId: brandId ?? this.brandId,
            size: size ?? this.size,
            price: price ?? this.price,
            image: image ?? this.image,
            stock: stock ?? this.stock,
            model3D: model3D ?? this.model3D,
        );

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        categoryId: json['categoryId'],
        genderId: json['genderId'],
        brandId: json['brandId'],
        size: json['size'],
        price: json['price'],
        image: json['image'],
        stock: json['stock'],
        model3D: json['model3d'],
    );

    Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'rating': rating,
        'categoryId': categoryId,
        'genderId': genderId,
        'brandId': brandId,
        'size': size,
        'price': price,
        'image': image,
        'stock': stock,
        'model3d': model3D,
    };
}
