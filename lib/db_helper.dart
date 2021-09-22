import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:kontak/models/fav_contact.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'favcontacts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          email TEXT,
          company TEXT,
          job TEXT
      )
      ''');
  }

  Future<List<FavContact>> getGroceries() async {
    Database db = await instance.database;
    var contactLists = await db.query('favcontacts', orderBy: 'name');
    List<FavContact> favContactList = contactLists.isNotEmpty
        ? contactLists.map((c) => FavContact.fromMap(c)).toList()
        : [];
    return favContactList;
  }

  Future<int> add(FavContact favContact) async {
    Database db = await instance.database;
    return await db.insert('favcontacts', favContact.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('favcontacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(FavContact favContact) async {
    Database db = await instance.database;
    return await db.update('favcontacts', favContact.toMap(),
        where: "id = ?", whereArgs: [favContact.id]);
  }
}


