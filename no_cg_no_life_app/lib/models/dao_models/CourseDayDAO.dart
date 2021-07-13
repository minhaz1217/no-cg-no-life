
import 'package:no_cg_no_life_app/models/dao_models/DAO.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import '../CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';

class CourseDAO implements DAO<Course>{

  final _tableName = 'course';
  final _columnId = 'id';
  final _columnName = 'name';
  final _columnCode = 'code';
  final _columnSection = 'section';
  final _columnFaculty = 'faculty';
  final _columnCourseType = 'course_type';
  final _columnWeekDay1 = 'week_day_1';
  final _columnWeekDay1StartTime = 'week_day1_start_time';
  final _columnWeekDay1EndTime = 'week_day1_end_time';

  final _columnWeekDay2 = 'week_day2';
  final _columnWeekDay2StartTime = 'week_day2_start_time';
  final _columnWeekDay2EndTime = 'week_day2_end_time';

  final _columnCreatedAt = 'created_at';
  final _columnUpdatedAt = 'updated_at';


  @override
  String get createTableQuery =>
      "CREATE TABLE $_tableName("
          "$_columnId TEXT PRIMARY KEY,"
          " $_columnName TEXT,"
          " $_columnCode TEXT"
          " $_columnSection TEXT"
          " $_columnFaculty TEXT"
          " $_columnCourseType TEXT"
          " $_columnWeekDay1 TEXT"
          " $_columnWeekDay1StartTime TEXT"
          " $_columnWeekDay1EndTime TEXT"
          " $_columnWeekDay2 TEXT"
          " $_columnWeekDay2StartTime TEXT"
          " $_columnWeekDay2EndTime TEXT"
          " $_columnCreatedAt TEXT"
          " $_columnUpdatedAt TEXT"

          ")";

  @override
  Course fromMap(Map<String, dynamic> query) {
    Course course = Course(
      courseName: query[_columnName],
      courseCode: query[_columnCode],
      section: query[_columnSection],
      faculty: query[_columnFaculty],
      courseType:  query[_columnCourseType],

      weekDay1:  query[_columnWeekDay1],
      day1StartTime:  query[_columnWeekDay1StartTime],
      day1EndTime:  query[_columnWeekDay1EndTime],

      weekDay2:  query[_columnWeekDay2],
      day2StartTime:  query[_columnWeekDay2StartTime],
      day2EndTime:  query[_columnWeekDay2EndTime],
    );
    course.id  = query[_columnId];
    course.createdAt  = query[_columnCreatedAt];
    course.updatedAt  = query[_columnUpdatedAt];


    return course;
  }

  @override
  Map<String, dynamic> toMap(Course object) {
    return <String, dynamic>{
    };
  }

  @override
  List<Course> fromList(List<Map<String,dynamic>> query) {
    List<Course> notes = List<Course>.empty(growable: true);
    // for (Map map in query) {
    //   notes.add(fromMap(map));
    // }
    return notes;
  }

}