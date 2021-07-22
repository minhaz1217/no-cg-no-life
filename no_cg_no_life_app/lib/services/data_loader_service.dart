
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/helpers/common_snackbar.dart';
import 'package:no_cg_no_life_app/helpers/date_helper.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';

class DataLoaderService{
  // readJsonFromFile receives a path and outputs json data.
  Future<dynamic> readJsonFromFile(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    return data;
  }


  Future readAdvisingCourseDataFromLocalJson(String name) async {
    try{

      var data = await this.readJsonFromFile("assets/data/$name.json");
      List<Course> courses = List<Course>.empty(growable: true);
      for(int i=0;i< (data["$name"].length);i++){
        Course course = Course();
        var row = data["$name"][i];
        course.code = row["course"];
        course.name = course.code;

        print(i);

        course.section = int.parse(row["section"].toString().trim());
        course.instructor = row["instructor"].toString().trim();
        course.roomNumber = row["room_no"].toString().trim();

        if(row["weekday"].toString().trim().length >=2){
          course.weekDay1 = getWeekDay( row["weekday"][0], row["time_from"], row["time_to"] );
          course.weekDay2 = getWeekDay( row["weekday"][1], row["time_from"], row["time_to"] );
          courses.add(course);
        }else if(row["weekday"].toString().trim().length >=1){
          // here if we have a single week day, that either means that our course is a lab course, or that we have another course day with same course code and section.
          // instead of searching in front, we will search in the back, that way our paired course will already be in the courses, so we'll be able to match.
          bool found = false;
          for(int j=0;j<courses.length;j++){
            if(courses[j].code == course.code && courses[j].section == course.section){
              // we got a match, so we'll put this course's weekday, start and end time, to that course's weekDay2
              courses[j].weekDay2 = getWeekDay( row["weekday"][0], row["time_from"], row["time_to"] );
              found = true;
              break;
            }
          }
          // if we didn't found another course, that means, this course is either a lab course or the first instance of this course, either way we'll have to insert it in the courses list.
          if(found == false){
            course.weekDay1 = getWeekDay( row["weekday"][0], row["time_from"], row["time_to"] );
            courses.add(course);
          }
        }
      }

      courses.forEach((element) {
        print(element);
      });
    }catch(ex){
      showError( "Data load error: $ex" );
    }
  }


  CourseDay getWeekDay(String weekShortCode, String start, String end){
    DayOfTheWeek dayOfWeek = DayOfTheWeek.Sunday;
    weekShortCode = weekShortCode.toUpperCase();
    switch(weekShortCode){
      case "S":
        dayOfWeek = DayOfTheWeek.Sunday;
        break;
      case "M":
        dayOfWeek = DayOfTheWeek.Monday;
        break;
      case "T":
        dayOfWeek = DayOfTheWeek.Tuesday;
        break;
      case "W":
        dayOfWeek = DayOfTheWeek.Wednesday;
        break;
      case "R":
        dayOfWeek = DayOfTheWeek.Thursday;
        break;
      case "F":
        dayOfWeek = DayOfTheWeek.Friday;
        break;
      case "A":
        dayOfWeek = DayOfTheWeek.Saturday;
        break;
    }

    CourseDay courseDay = CourseDay( weekDay: dayOfWeek, startTime: convertAdvisingTimeToAMPM(start), endTime: convertAdvisingTimeToAMPM(end) );
    return courseDay;
  }

  DateTime convertAdvisingTimeToAMPM(String time){
    DateTime pmStart = DateFormat("hh:mm").parse("12:00");
    DateTime pmEnd = DateFormat("hh:mm").parse("07:00");
    DateTime dateTime = DateFormat('hh:mm').parse(time);
    if( (dateTime.isAfter(pmStart) && dateTime.isBefore(pmEnd)) || pmStart.compareTo(dateTime) >= 0 ){
      dateTime = DateFormat("hh:mm a").parse("$time PM");
    }else{
      dateTime = DateFormat("hh:mm a").parse("$time AM");
    }
    return dateTime;
  }


}