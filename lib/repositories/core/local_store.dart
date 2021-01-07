import 'dart:io';

import 'package:innim_lib/database.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class LocalStore extends LocalDatabase {
  LocalStore()
      : super(() async => Directory(await sqflite.getDatabasesPath()),
            databaseName: 'TennisStat.db', version: 1);

  @override
  List<String> getCreateTablesSql() {
    return [
      // createKeyValueTableSql('user'),
      '''
CREATE TABLE `player` (
  `uid`            TEXT PRIMARY KEY,
  `firstName`      TEXT,
  `lastName`       TEXT,
  `isRemoved`      INTEGER
);''',
    ];
  }

  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    // final batch = db.batch();
    // Future<void> _do(_Upgrade upgrade) => upgrade.run(db, batch);

    // if (oldVersion < 2) await _do(_V2());

    // await batch.commit();
  }
}

// abstract class _Upgrade {
//   Future<void> run(Database db, Batch batch);
// }
