

import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';

class CourseService{
  late List<bool> visited;
  late List<Course> allCourses;
  late List< List<Course> > finalCourses;

  CourseService(){
    visited = new List<bool>.empty(growable: true);
    finalCourses = new List< List<Course> >.empty(growable: true);
    List<Course> allCourses = new List<Course>.empty(growable: true);
  }

  // getConflictFreeCourses returns conflict free courses, from the list of courses and only outputs the required number of courses
  List<List<Course>> getConflictFreeCourses( List<Course> courses, int totalCourses ){
    finalCourses = new List< List<Course> >.empty(growable: true);
    if(courses.isEmpty){
      return finalCourses;
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
    return finalCourses;
  }


  void findConflictFreeCourses(List<Course> list, int totalCourses){
    if(list.length == totalCourses){
      finalCourses.add(List.from(list));
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
    return;
  }

  // detectCourseListConflict detects both same code conflict and same time conflict
  bool detectCourseListConflict( List<Course> currentList, Course nextCourse ){
    for(int i=0;i<currentList.length;i++){
      // to take a lab course we need that lab course's complimentary course in the list
      // to take a course that has a lab course we'll need to take both of them at the same time.
      if( detectConflictOfLabCourses(currentList, nextCourse) || detectCourseNameOrCodeConflict(currentList[i], nextCourse) ||  detectCourseTimeConflict(currentList[i], nextCourse)){
        return true;
      }
    }
    return false; // no conflict
  }

  bool detectConflictOfLabCourses(List<Course> currentList, Course labCourse){
    if(labCourse.courseType != CourseType.LabCourse || currentList.length <= 0){
      return false; // no conflict, can this this course
    }
    var labCourseCode = labCourse.code.toLowerCase();
    for(int i=0;i<currentList.length;i++){
      if(currentList[i].courseType == CourseType.NormalCourse && ( labCourseCode.contains(currentList[i].code.toLowerCase())) ){
        return true; // lab course's code contains normal course's code, CSE101LAB contains CSE101, so we can take CSE101Lab
      }
    }
    return true; // conflict, can't take this next course, because this lab course's complimentary isn't in the list
  }

  // detectCourseNameOrCodeConflict detects conflict between code and names, as if we already have this course in our list, we should not be able to take it in this semester
  bool detectCourseNameOrCodeConflict(Course course1, Course course2){
    var code1 = course1.code.toLowerCase();
    var code2 = course2.code.toLowerCase();
    var name1 = course1.name.toLowerCase();
    var name2 = course2.name.toLowerCase();
    return code1 == code2 || name1 == name2 || code1 == name2 || code2 == name1;
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