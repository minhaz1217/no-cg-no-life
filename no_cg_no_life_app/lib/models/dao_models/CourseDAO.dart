
import 'package:flutter/foundation.dart';
import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/enums/CourseUseageType.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/enums/InsertType.dart';
import 'package:no_cg_no_life_app/models/dao_models/DAO.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';

class CourseDAO implements DAO<Course>{

  // TODO: instead of DAO try to use reflection or annotations.
  final _tableName = 'course';
  final _columnId = 'id';
  final _columnName = 'name';
  final _columnCode = 'code';
  final _columnSection = 'section';
  final _columnInstructor = 'instructor';
  final _columnRoomNumber = 'room_number';
  final _columnCourseType = 'course_type';
  final _columnCourseUsageType = 'course_usage_type';
  final _columnCourseEntryType = 'course_entry_type';
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
          " $_columnCode TEXT,"
          " $_columnSection INTEGER,"
          " $_columnInstructor TEXT,"
          " $_columnRoomNumber TEXT,"
          " $_columnCourseType TEXT,"
          " $_columnCourseUsageType TEXT,"
          " $_columnCourseEntryType TEXT,"
          " $_columnWeekDay1 TEXT,"
          " $_columnWeekDay1StartTime TEXT,"
          " $_columnWeekDay1EndTime TEXT,"
          " $_columnWeekDay2 TEXT,"
          " $_columnWeekDay2StartTime TEXT,"
          " $_columnWeekDay2EndTime TEXT,"
          " $_columnCreatedAt TEXT,"
          " $_columnUpdatedAt TEXT"
          ");";

  @override
  Course fromMap(Map<String, dynamic> query) {
    Course course = Course(
      courseName: query[_columnName],
      courseCode: query[_columnCode],
      section: query[_columnSection],
      instructor: query[_columnInstructor],
      roomNumber: query[_columnRoomNumber],
      courseType :  CourseType.values[ int.parse(query[_columnCourseType]??"0") ],
      courseUsageType:  CourseUsageType.values[ int.parse(query[_columnCourseUsageType]??"0") ],
      courseEntryType:  CourseEntryType.values[ int.parse(query[_columnCourseEntryType]??"0") ],

      weekDay1:   StringToDayOfTheWeek(query[_columnWeekDay1]?? "") ,
      day1StartTime:  DateTime.parse(query[_columnWeekDay1StartTime]??"1970-01-01"),
      day1EndTime:  DateTime.parse(query[_columnWeekDay1EndTime]??"1970-01-01"),

      weekDay2:  StringToDayOfTheWeek(query[_columnWeekDay2]?? ""),
      day2StartTime:  DateTime.parse(query[_columnWeekDay2StartTime]??"1970-01-01"),
      day2EndTime:  DateTime.parse(query[_columnWeekDay2EndTime]??"1970-01-01"),
    );
    course.id  = query[_columnId]??"";
    course.createdAt  = DateTime.parse(query[_columnCreatedAt]??"1970-01-01");
    course.updatedAt  = DateTime.parse(query[_columnUpdatedAt]??"1970-01-01");
    return course;
  }

  @override
  Map<String, dynamic> toMap(Course model) {
    var mp = <String, dynamic>{
    _columnId: model.id,
    _columnName: model.name,
    _columnCode: model.code,
    _columnSection : model.section,
    _columnInstructor : model.instructor,
    _columnRoomNumber : model.roomNumber,
    _columnCourseType : model.courseType.index,
    _columnCourseUsageType : model.courseUsageType.index,
    _columnCourseEntryType : model.courseEntryType.index,

    _columnWeekDay1 : DayOfTheWeekToString(model.weekDay1.weekDay) ,
    _columnWeekDay1StartTime: model.weekDay1.startTime.toString(),
    _columnWeekDay1EndTime : model.weekDay1.endTime.toString(),

    _columnWeekDay2 : DayOfTheWeekToString(model.weekDay2.weekDay),
    _columnWeekDay2StartTime : model.weekDay2.startTime.toString(),
    _columnWeekDay2EndTime : model.weekDay2.endTime.toString(),

    _columnCreatedAt : model.createdAt.toString(),
    _columnUpdatedAt : model.updatedAt.toString(),
    };
    return mp;
  }

  @override
  List<Course> fromList(List<Map<String,dynamic>> query) {
    List<Course> notes = List<Course>.empty(growable: true);
    for (var map in query) {
      notes.add(fromMap(map));
    }
    return notes;
  }
  @override
  String getTableName(){
    return this._tableName;
  }
}