import 'package:uuid/uuid.dart';

class BaseDomainModel{
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  BaseDomainModel({ String? id, DateTime? createdAt ,DateTime? updatedAt }) :
        this.id = id == null? Uuid().v4.toString() : id,
        this.createdAt = createdAt == null? DateTime.now().toUtc() : createdAt.toUtc(),
        this.updatedAt = updatedAt == null? DateTime.now().toUtc() : updatedAt.toUtc()
  ;
}