import 'package:drift/drift.dart';
import 'cart_item_model.dart';
import 'connection.dart' as conn;
import 'favorite_model.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Favorites, Cart])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(conn.connect());

  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> getFavoriteProducts(int userId) {
    final query = select(favorites)..where((tbl) => tbl.userId.equals(userId));
    return query.get();
  }

  Future<bool> existsProduct(int productId, int userId) async {
    final query = select(favorites)
      ..where(
          (tbl) => tbl.productId.equals(productId) & tbl.userId.equals(userId));
    final result = await query.getSingleOrNull();
    return result != null;
  }

  Future<int> insertItem(FavoriteModel item) {
    final entity = FavoritesCompanion(
      productId: Value(item.productId ?? 0),
      image: Value(item.image!),
      name: Value(item.name!),
      price: Value(item.price!),
      rating: Value(item.rating!),
      src3dModel: Value(item.src3dModel ?? ''),
      userId: Value(item.userId),
    );

    return into(favorites).insert(entity);
  }

  Future<int> deleteItem(int id) {
    final query = delete(favorites)..where((tbl) => tbl.productId.equals(id));
    return query.go();
  }

  //Shopping Cart

  Future<List<CartData>> getCartItems(int userId) {
    final query = select(cart)..where((tbl) => tbl.userId.equals(userId));
    return query.get();
  }

  Future<int> insertCartItem(CartItem item) {
    final entity = CartCompanion(
      productId: Value(item.productId ?? 0),
      image: Value(item.image!),
      name: Value(item.name!),
      size: Value(item.size!),
      price: Value(item.price!),
      quantity: Value(item.quantity!),
      userId: Value(item.userId),
    );

    return into(cart).insert(entity);
  }

    Future<bool> existsCartItem(int productId, int userId) async {
    final query = select(cart)
      ..where(
          (tbl) => tbl.productId.equals(productId) & tbl.userId.equals(userId));
    final result = await query.getSingleOrNull();
    return result != null;
  }

  Future<int> deleteAllByUserId(int userId) {
    final query = delete(cart)..where((tbl) => tbl.userId.equals(userId));
    return query.go();
  }
  

  Future<int> deleteCartItem(int id, int userId) {
    final query = delete(cart)..where((tbl) => tbl.productId.equals(id) & tbl.userId.equals(userId));
    return query.go();
  }
}
