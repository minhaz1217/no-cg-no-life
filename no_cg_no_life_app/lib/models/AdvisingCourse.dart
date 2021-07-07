import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/Course.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';

class AdvisingCourse extends Course {
  CourseDay weekDay1;
  CourseDay weekDay2;

  AdvisingCourse( {
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
        super( code: courseCode ?? "N/A", faculty: faculty??"TBA",name: courseCode?? "",section: section??0 ){}
// TODO: maybe later try to implement constant data, that will give course name given the course code

}