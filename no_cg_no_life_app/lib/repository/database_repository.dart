import 'package:sqflite/sqflite.dart';

abstract class DatabaseRepository{
  Database getDB();
}