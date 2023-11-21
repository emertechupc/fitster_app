import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  TextColumn get image => text()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  RealColumn get rating => real()();
  TextColumn get src3dModel => text()();
  IntColumn get userId => integer()();
}