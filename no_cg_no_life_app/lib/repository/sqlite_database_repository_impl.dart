
import 'dart:io';

import 'package:no_cg_no_life_app/models/dao_models/CourseDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'database_repository.dart';

// HOW TO USE
// Where ever you need a database, you call db = DBService.instance(), then use the methods it gives.
// in critical cases where raw queries are necessary use maintDB = db.getDB() the raw query in that.
class SqliteDatabaseRepositoryImpl implements DatabaseRepository{
  String dbName = "no_cg_no_life.db";
  Database? _database;  // this is the main sqflite database.
  static final SqliteDatabaseRepositoryImpl _singleton = SqliteDatabaseRepositoryImpl._internal(); // this is just a singleton instance of this class, unless absolutely necessary, we'll use this. This maintains that our app has only one instance of the database.

  factory SqliteDatabaseRepositoryImpl() {
    return _singleton;
  }

  SqliteDatabaseRepositoryImpl._internal(){
    this._initialize();
  }

  // getDB returns the main db for extra operations.
  Database getDB(){
    return _database!;
  }

  // _initialize is used to create and setup the databse.
  Future<SqliteDatabaseRepositoryImpl> _initialize() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    // Making sure the directory exists
    try {
      await Directory(databasesPath).create(recursive: true);

      _onCreate(Database db, int version) async {
        _createTables(db);
      }

      _onUpgrade(Database db, int oldVersion, int newVersion) async {
        print("UPDATED");
      }
      _onOpen(Database db) async {
        // print('db version ${await db.getVersion()}');
      }

      var db = await openDatabase(
        path,
        version: 4,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: onDatabaseDowngradeDelete,
        onOpen: _onOpen,
      );
      this._database = db;

    } catch (e) {
      print("DB ERROR: $e");
    }
    return this;
  }

  // _createTables creates the necessary tables needed for the database when created.
  void _createTables(Database db){
    db.rawInsert(CourseDAO().createTableQuery);
  }
}