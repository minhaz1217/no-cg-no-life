
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';

//
// To get a super basic idea about the useage of this class you can read: https://applandeo.com/blog/sqflite-flutter-database/
abstract class DAO<T extends BaseDomainModel> {
  //queries
  String get createTableQuery;

  T fromMap(Map<String, dynamic> query);
  List<T> fromList(List<Map<String,dynamic>> query);
  Map<String, dynamic> toMap(T object);
}