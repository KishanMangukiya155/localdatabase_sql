import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbController extends GetxController {
  late Database db;

  Future<void> dbInit() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'user_db.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }
}
