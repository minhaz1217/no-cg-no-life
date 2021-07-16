import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';

abstract class BaseRepository< T extends BaseDomainModel >{
  Future<T?> getByID(String id);

  Future<List<T>> getAll({bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset});

  Future<int?> create(T model);
  Future<int> update(T model);
  Future<int> delete(T model);
}
