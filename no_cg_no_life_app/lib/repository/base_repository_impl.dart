
import 'package:no_cg_no_life_app/models/dao_models/DAO.dart';
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/repository/database_repository.dart';
import 'package:uuid/uuid.dart';

class BaseRepositoryImpl< T extends BaseDomainModel> implements BaseRepository<T>{
  final DatabaseRepository databaseRepository;
  final DAO<T> dao;
  BaseRepositoryImpl(
      DatabaseRepository databaseRepository,
      DAO<T> dao): this.databaseRepository = databaseRepository, this.dao = dao
  ;


  @override
  Future<T?> getByID(String id) async {
    if(this.databaseRepository.getDB().isOpen){
      var result = await this.databaseRepository.getDB().query(dao.getTableName(), where: "id = ? ", whereArgs: <String>[ id.trim() ] );
      return dao.fromList(result).first;
    }else{
      print("getByID: db not open");
    }
    return null;
  }

  @override
  Future<int?> create(T model) async {
    if(this.databaseRepository.getDB().isOpen){
      var result = this.databaseRepository.getDB().insert( dao.getTableName() , dao.toMap(model));
      return result;
    }else{
      print("create: db not open");
    }
    return 0;
  }

  // returns 0 the number of affected row.
  @override
  Future<int> delete(T model) async {
    if(this.databaseRepository.getDB().isOpen){
      var result = await this.databaseRepository.getDB().delete( dao.getTableName(), where: "id = ? ", whereArgs: <String>[ model.id.trim() ] );
      return result;
    }else{
      print("delete: db not open");
    }
    return 0;
  }

  @override
  Future<List<T>> getAll({bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset}) async {
    if(this.databaseRepository.getDB().isOpen){
      var result = await this.databaseRepository.getDB().query(
          dao.getTableName(),
          distinct: distinct,
          columns: columns,
          where: where,
          whereArgs: whereArgs,
          groupBy: groupBy,
          having: having,
          orderBy: orderBy,
          limit: limit,
          offset: offset);
      return dao.fromList(result);
    }else{
      print("getAll: db not open");
    }

    return List<T>.empty();
  }


  @override
  Future<int> update(T model) async {
    if(this.databaseRepository.getDB().isOpen){
      var result = await this.databaseRepository.getDB().update( dao.getTableName(), dao.toMap(model), where: "id = ?", whereArgs: <String>[ model.id ] );
      return result;
    }else{
      print("update: db not open");
    }
    return 0;
  }



}