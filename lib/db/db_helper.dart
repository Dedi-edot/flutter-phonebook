import 'dart:io';

import 'package:kontak/models/fav_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'fav_contact.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          email TEXT,
          company TEXT,
          job TEXT,
          image TEXT
      )
      ''');
  }

  Future<List<FavModel>> getFavContact() async {
    Database db = await instance.database;
    var favorite = await db.query('favorites', orderBy: 'name');
    List<FavModel> favContactList = favorite.isNotEmpty
        ? favorite.map((c) => FavModel.fromMap(c)).toList()
        : [];
    return favContactList;
  }

  Future<int> add(FavModel favContact) async {
    Database db = await instance.database;
    return await db.insert('favorites', favContact.toMap());
  }

  Future<int> update(FavModel favContact) async {
    Database db = await instance.database;
    return await db.update('favorites', favContact.toMap(),
        where: "id = ?", whereArgs: [favContact.id]);
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

}