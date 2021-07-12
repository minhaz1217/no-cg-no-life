import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/domain_models/BaseDomainModel.dart';
import '../CourseDay.dart';

class Course extends BaseDomainModel{

  String name;
  String code;
  int section;
  String _faculty;
  CourseDay weekDay1;
  CourseDay weekDay2;

  Course( {
    String? courseCode,
    int? section,
    String? faculty,

    DayOfTheWeek? weekDay1,
    DateTime? day1StartTime,
    DateTime? day1EndTime,

    DayOfTheWeek? weekDay2,
    DateTime? day2StartTime,
    DateTime? day2EndTime,} )
      : weekDay1 = CourseDay( weekDay: weekDay1 ?? DayOfTheWeek.Friday , startTime: day1StartTime, endTime:  day1EndTime ),
        weekDay2 = CourseDay( weekDay: weekDay2 ?? DayOfTheWeek.Friday , startTime: day2StartTime, endTime:  day2EndTime ),
        this.code = courseCode ?? "N/A",
        this._faculty = faculty??"TBA",
        this.name = courseCode ?? "", // for now our course code and name will be same.
        this.section= section??0
  {}
// TODO: maybe later try to implement constant data, that will give course name automatically given the course code

  String get faculty => _faculty;
  set faculty(String value) {
    _faculty = value.toUpperCase();
  }
// TODO: write test so that faculty initials is always set to upper case, maybe remove number or special characters from faculty initials?
}