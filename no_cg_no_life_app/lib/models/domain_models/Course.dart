import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';

class Course extends BaseDomainModel{

  String name;
  String _code;
  int section;
  String _instructor;
  CourseDay weekDay1;
  CourseDay weekDay2;
  CourseType courseType;
  String roomNumber;

  Course( {

    String? courseName,
    String? courseCode,
    int? section,
    String? faculty,
    CourseType? courseType,
    String? roomNumber,
    DayOfTheWeek? weekDay1,
    DateTime? day1StartTime,
    DateTime? day1EndTime,

    DayOfTheWeek? weekDay2,
    DateTime? day2StartTime,
    DateTime? day2EndTime,} )
      : weekDay1 = CourseDay( weekDay: weekDay1 ?? DayOfTheWeek.Friday , startTime: day1StartTime, endTime:  day1EndTime ),
        weekDay2 = CourseDay( weekDay: weekDay2 ?? DayOfTheWeek.Friday , startTime: day2StartTime, endTime:  day2EndTime ),
        this._code = courseCode ?? "N/A",
        this._instructor = faculty??"TBA",
        this.name = courseName != null ? courseName : (courseCode??""), // for now our course code and name will be same.
        this.section= section??0,
        this.courseType = courseType?? CourseType.AdvisingCourse,
        this.roomNumber = roomNumber?? "0"
  ;
// TODO: maybe later try to implement constant data, that will give course name automatically given the course code

  String get code => _code;
  set code(String value){
    _code = value.trim().replaceAll(". ", "").toUpperCase();
  }
  String get instructor => _instructor;
  set instructor(String value) {
    _instructor = value.toUpperCase();
  }
// TODO: write test so that faculty initials is always set to upper case, maybe remove number or special characters from faculty initials?

  @override
  String toString(){
      return "${this.name} (${this.code}) : ${this.section} | ${this.roomNumber} Time: ${this.weekDay1} - ${this.weekDay2}";
  }
}