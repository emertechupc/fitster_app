// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _src3dModelMeta =
      const VerificationMeta('src3dModel');
  @override
  late final GeneratedColumn<String> src3dModel = GeneratedColumn<String>(
      'src3d_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, image, name, price, rating, src3dModel, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('src3d_model')) {
      context.handle(
          _src3dModelMeta,
          src3dModel.isAcceptableOrUnknown(
              data['src3d_model']!, _src3dModelMeta));
    } else if (isInserting) {
      context.missing(_src3dModelMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      src3dModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}src3d_model'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int productId;
  final String image;
  final String name;
  final double price;
  final double rating;
  final String src3dModel;
  final int userId;
  const Favorite(
      {required this.id,
      required this.productId,
      required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.src3dModel,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['image'] = Variable<String>(image);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['rating'] = Variable<double>(rating);
    map['src3d_model'] = Variable<String>(src3dModel);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      productId: Value(productId),
      image: Value(image),
      name: Value(name),
      price: Value(price),
      rating: Value(rating),
      src3dModel: Value(src3dModel),
      userId: Value(userId),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      rating: serializer.fromJson<double>(json['rating']),
      src3dModel: serializer.fromJson<String>(json['src3dModel']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'rating': serializer.toJson<double>(rating),
      'src3dModel': serializer.toJson<String>(src3dModel),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Favorite copyWith(
          {int? id,
          int? productId,
          String? image,
          String? name,
          double? price,
          double? rating,
          String? src3dModel,
          int? userId}) =>
      Favorite(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        src3dModel: src3dModel ?? this.src3dModel,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('src3dModel: $src3dModel, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productId, image, name, price, rating, src3dModel, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.image == this.image &&
          other.name == this.name &&
          other.price == this.price &&
          other.rating == this.rating &&
          other.src3dModel == this.src3dModel &&
          other.userId == this.userId);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> image;
  final Value<String> name;
  final Value<double> price;
  final Value<double> rating;
  final Value<String> src3dModel;
  final Value<int> userId;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.rating = const Value.absent(),
    this.src3dModel = const Value.absent(),
    this.userId = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String image,
    required String name,
    required double price,
    required double rating,
    required String src3dModel,
    required int userId,
  })  : productId = Value(productId),
        image = Value(image),
        name = Value(name),
        price = Value(price),
        rating = Value(rating),
        src3dModel = Value(src3dModel),
        userId = Value(userId);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? image,
    Expression<String>? name,
    Expression<double>? price,
    Expression<double>? rating,
    Expression<String>? src3dModel,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (rating != null) 'rating': rating,
      if (src3dModel != null) 'src3d_model': src3dModel,
      if (userId != null) 'user_id': userId,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<String>? image,
      Value<String>? name,
      Value<double>? price,
      Value<double>? rating,
      Value<String>? src3dModel,
      Value<int>? userId}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      src3dModel: src3dModel ?? this.src3dModel,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (src3dModel.present) {
      map['src3d_model'] = Variable<String>(src3dModel.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('src3dModel: $src3dModel, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, image, name, size, price, quantity, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart';
  @override
  VerificationContext validateIntegrity(Insertable<CartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(attachedDatabase, alias);
  }
}

class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int productId;
  final String image;
  final String name;
  final String size;
  final double price;
  final int quantity;
  final int userId;
  const CartData(
      {required this.id,
      required this.productId,
      required this.image,
      required this.name,
      required this.size,
      required this.price,
      required this.quantity,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['image'] = Variable<String>(image);
    map['name'] = Variable<String>(name);
    map['size'] = Variable<String>(size);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: Value(id),
      productId: Value(productId),
      image: Value(image),
      name: Value(name),
      size: Value(size),
      price: Value(price),
      quantity: Value(quantity),
      userId: Value(userId),
    );
  }

  factory CartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<String>(json['size']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<String>(size),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'userId': serializer.toJson<int>(userId),
    };
  }

  CartData copyWith(
          {int? id,
          int? productId,
          String? image,
          String? name,
          String? size,
          double? price,
          int? quantity,
          int? userId}) =>
      CartData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
        name: name ?? this.name,
        size: size ?? this.size,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, image, name, size, price, quantity, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.image == this.image &&
          other.name == this.name &&
          other.size == this.size &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.userId == this.userId);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> image;
  final Value<String> name;
  final Value<String> size;
  final Value<double> price;
  final Value<int> quantity;
  final Value<int> userId;
  const CartCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.userId = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String image,
    required String name,
    required String size,
    required double price,
    required int quantity,
    required int userId,
  })  : productId = Value(productId),
        image = Value(image),
        name = Value(name),
        size = Value(size),
        price = Value(price),
        quantity = Value(quantity),
        userId = Value(userId);
  static Insertable<CartData> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? image,
    Expression<String>? name,
    Expression<String>? size,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (size != null) 'size': size,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (userId != null) 'user_id': userId,
    });
  }

  CartCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<String>? image,
      Value<String>? name,
      Value<String>? size,
      Value<double>? price,
      Value<int>? quantity,
      Value<int>? userId}) {
    return CartCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      name: name ?? this.name,
      size: size ?? this.size,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $CartTable cart = $CartTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites, cart];
}
