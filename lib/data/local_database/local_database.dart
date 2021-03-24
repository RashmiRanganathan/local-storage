import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database database;
  String tableName;

  LocalDatabase(this.tableName);

  Future<void> init(String onCreateCommands) async {
    database = await openDatabase(
      join(await getDatabasesPath(), '$tableName.db'),
      onCreate: (db, version) {
        return db.execute(onCreateCommands);
      },
      version: 1,
    );
  }

  Future<void> create(Map<String, dynamic> json) async {
    await database.insert(
      tableName,
      json,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> get() async {
    final List<Map<String, dynamic>> maps = await database.query(tableName);
    return maps;
  }
}
