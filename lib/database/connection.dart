import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

LazyDatabase connect() {
  return LazyDatabase(() async {
    final appDir = await getApplicationCacheDirectory();
    final dbPath = path.join(appDir.path, 'local.sqlite');

    return NativeDatabase.createInBackground(File(dbPath));
  });
}
