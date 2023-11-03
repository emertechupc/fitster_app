import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  TextColumn get image => text()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  RealColumn get rating => real()();
  IntColumn get userId => integer()();
}