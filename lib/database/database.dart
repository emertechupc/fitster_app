import 'package:drift/drift.dart';
import 'connection.dart' as conn;
import 'favorite_model.dart';
import 'tables.dart'; 

part 'database.g.dart';

@DriftDatabase(tables: [Favorites])
class AppDatabase extends _$AppDatabase {
  AppDatabase(): super(conn.connect());

  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> getFavoriteProducts(int userId) {
    final query = select(favorites)..where((tbl) => tbl.userId.equals(userId));
    return query.get();
  }
  
  Future<bool> existsProduct(int productId, int userId) async {
    final query = select(favorites)..where((tbl) => tbl.productId.equals(productId) & tbl.userId.equals(userId));
    final result = await query.getSingleOrNull();
    return result != null;
  }

  Future<int> insertItem(FavoriteModel item) {
    final entity = FavoritesCompanion(
      productId: Value(item.productId),
      image: Value(item.image!),
      name: Value(item.name!),
      price: Value(item.price!),
      rating: Value(item.rating!),
      userId: Value(item.userId),
    );

    return into(favorites).insert(entity);
  }

  Future<int> deleteItem(int id){
    final query = delete(favorites)..where((tbl) => tbl.productId.equals(id));
    return query.go();
  }
}