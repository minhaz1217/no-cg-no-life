import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';

class CourseDay{
  DateTime startTime;
  DateTime endTime;
  DayOfTheWeek weekDay;
  CourseDay({ DateTime? startTime, DateTime? endTime, this.weekDay = DayOfTheWeek.Friday } )
      : this.startTime= startTime ?? DateTime.now(),
        this.endTime = endTime ?? DateTime.now()  {}
}