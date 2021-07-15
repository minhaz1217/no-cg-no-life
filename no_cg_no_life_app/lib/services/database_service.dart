
import 'dart:io';

import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/dao_models/CourseDayDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// HOW TO USE
// Where ever you need a database, you call db = DBService.instance(), then use the methods it gives.
// in critical cases where raw queries are necessary use maintDB = db.getDB() the raw query in that.
class DBService{
  String dbName = "no_cg_no_life.db";
  Database? _database;  // this is the main sqflite database.
  static DBService? _db;  // this is just a singleton instance of this class, unless absolutely necessary, we'll use this. This maintains that our app has only one instance of the database.

  static Future<DBService> instance() async {
    if(_db == null){
      _db = await DBService()._initialize();
    }
    return _db!;
  }
  Database getDB(){
    return _database!;
  }

  Future<DBService> _initialize() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    // Making sure the directory exists
    try {
      await Directory(databasesPath).create(recursive: true);

      _onCreate(Database db, int version) async {
        print("Created");
        createTables(db);

      }

      _onUpgrade(Database db, int oldVersion, int newVersion) async {
        print("Updated");
        createTables(db);
        print("Updated2");
      }
      _onOpen(Database db) async {
        // print('db version ${await db.getVersion()}');
      }

      var db = await openDatabase(
        path,
        version: 3,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: onDatabaseDowngradeDelete,
        onOpen: _onOpen,
      );
      this._database = db;

    } catch (e) {
      print("ERROR $e");
    }
    return this;
  }

  void createTables(Database db){
    db.rawInsert(CourseDAO().createTableQuery);
  }

}