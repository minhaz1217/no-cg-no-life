
import 'package:no_cg_no_life_app/models/dao_models/DAO.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import '../CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';

class CourseDAO implements DAO<Course>{

  final tableName = 'course_day';
  final columnId = 'id';
  final _columnTitle = 'title';
  final _columnDescription = 'description';

  @override
  // TODO: implement createTableQuery
  String get createTableQuery => throw UnimplementedError();

  @override
  List<Course> fromList(List<Map<String, dynamic>> query) {
    // TODO: implement fromList
    throw UnimplementedError();
  }

  @override
  Course fromMap(Map<String, dynamic> query) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(Course object) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}