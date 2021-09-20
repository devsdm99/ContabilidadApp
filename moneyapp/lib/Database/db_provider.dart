import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:moneyapp/Models/category.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // PATH DONDE SE ALMACENA LA BASE DE DATOS
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'banking.db');
    print(path);

    //Crear base de datos

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE CATEGORIES (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          category TEXT
        );
        ''');
    });
  }

  Future<int> nuevaCategoriaRaw(Category category) async {
    //verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Categories(category)
      VALUES(${category.category})
    ''');

    return res;
  }

  Future<int> nuevaCategoria(Category category) async {
    //verificar la base de datos
    final db = await database;

    final res = await db.insert("Categories", category.toMap());

    return res;
  }
}
