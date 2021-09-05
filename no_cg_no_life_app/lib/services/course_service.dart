

import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';

class CourseService{
  late List<bool> visited;
  late List<Course> allCourses;
  late List< List<Course> > finalCourses;

  // getConflictFreeCourses returns conflict free courses, from the list of courses and only outputs the required number of courses
  List<List<Course>> getConflictFreeCourses( List<Course> courses, int totalCourses ){
    List<List<Course> > allConflictFreeCourses = List< List<Course> >.empty(growable: true);
    if(courses.isEmpty){
      return allConflictFreeCourses;
    }

    visited = new List<bool>.filled(courses.length, false);
    allCourses = courses;
    finalCourses = new List< List<Course> >.empty(growable: true);
    List<Course> emptyList = new List<Course>.empty(growable: true);

    this.findConflictFreeCourses(emptyList, totalCourses);

    for(int i=0;i<finalCourses.length;i++) {
      finalCourses[i].forEach((element2) {
        print(element2);
      });
    }
    // print("Number Of Courses : ${totalCourses}");
    return allConflictFreeCourses;
  }


  void findConflictFreeCourses(List<Course> list,int totalCourses){
    if(list.length == totalCourses){
      finalCourses.add(list);
      return;
    }

    for(int i=0;i<allCourses.length;i++){
      if(!visited[i]){
        if(!detectCourseListConflict(list, allCourses[i])){
          visited[i] = true;
          list.add(allCourses[i]);
          findConflictFreeCourses(list, totalCourses);
          list.remove( allCourses[i] );
          visited[i] = false;
        }
      }
    }

  }

  // detectCourseListConflict detects both same code conflict and same time conflict
  bool detectCourseListConflict( List<Course> currentList, Course nextCourse ){
    for(int i=0;i<currentList.length;i++){
      if(detectCourseTimeConflict(currentList[i], nextCourse)){
        return true;
      }
    }
    return false; // no conflict
  }

  // detectCourseTimeConflict detects conflict between 2 courses, if matchBothDays is set to true, then it will compare both weekDays, otherwise only the first weekDay
  bool detectCourseTimeConflict(Course course1, Course course2){
    var matchBothDays = true;
    if(course1.courseType == CourseType.LabCourse || course2.courseType == CourseType.LabCourse){
      matchBothDays = false;
    }
    if(detectConflictBetween2Days( course1.weekDay1, course2.weekDay1 )){
      return true;
    }

    if(matchBothDays && (
        detectConflictBetween2Days(course1.weekDay1, course2.weekDay2)
        || detectConflictBetween2Days(course1.weekDay2, course2.weekDay1)
        || detectConflictBetween2Days(course1.weekDay2, course2.weekDay2))
    ){
      return true;
    }
    return false; // no conflict detected
  }

  // detectConflictBetween2Days detects conflict between 2 course days comparing their start time end time.
  bool detectConflictBetween2Days(CourseDay day1, CourseDay day2){
    if(day1.weekDay != day2.weekDay){
      return false;
    }
    // day1's start time is between day2's time.
    if(
    day1.startTime.compareTo(day2.startTime) == 0 || day1.startTime.compareTo(day2.endTime) == 0 || day1.endTime.compareTo(day2.startTime) == 0 || day1.endTime.compareTo(day2.endTime) == 0 ||
    (day1.startTime.isAfter( day2.startTime ) && day1.startTime.isBefore(day2.endTime))
        || (day1.endTime.isAfter(day2.startTime) && day1.endTime.isBefore(day2.endTime))
        || (day2.startTime.isAfter(day1.startTime ) && day2.startTime.isBefore(day1.endTime))
        || (day2.endTime.isAfter(day1.startTime) && day2.endTime.isBefore(day1.endTime))
    ){
      return true;
    }
    return false; // no conflict
  }

}