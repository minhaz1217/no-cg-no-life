import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/helpers/date_helper.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';

class ShowAllAdvisingCourse extends StatefulWidget {
  @override
  _ShowAllAdvisingCourseState createState() => _ShowAllAdvisingCourseState();
}

class _ShowAllAdvisingCourseState extends State<ShowAllAdvisingCourse> {
  BaseRepository<Course> repository = Get.find();

  String getStartTimeEndTimeFromCourseDay(CourseDay day){
    return "(${convertDateTimeToAMPMTime(day.startTime)} - ${convertDateTimeToAMPMTime(day.endTime)})";
  }
  String getSubtitle(Course course){
    if(course.weekDay1.startTime.compareTo(course.weekDay2.startTime) == 0 && course.weekDay1.endTime.compareTo(course.weekDay2.endTime) == 0 ){
      // both start and end is same, so we can show just one.
      return "${ DayOfTheWeekToString(course.weekDay1.weekDay)} & ${DayOfTheWeekToString(course.weekDay2.weekDay)} ${getStartTimeEndTimeFromCourseDay(course.weekDay1)}";
    }
    return "${ DayOfTheWeekToString(course.weekDay1.weekDay)} ${getStartTimeEndTimeFromCourseDay(course.weekDay1)} & ${DayOfTheWeekToString(course.weekDay2.weekDay)} ${getStartTimeEndTimeFromCourseDay(course.weekDay2)}";

  }
  Widget singleList(Course course){
    return Card(
      child: ListTile(
        title: Text("${course.code.trim()} ${course.name.trim() == "" ? "" : "(${course.name.trim()})" } | Section: ${course.section}"),
        subtitle: Text( getSubtitle(course) ),
        isThreeLine: true,
        trailing: IconButton(
          icon: Icon( Icons.edit),
          onPressed: (){
            Map <String, dynamic> data={
              "course": course,
            };
            Navigator.pushNamed(context, "/advising-course/update", arguments: data);
          },
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text( T(context)!.showAllAdvisingCourse),
        elevation: 0,
        ),
      body: FutureBuilder< List<Course> >(
        future: repository.getAll( where: "course_type = ?", whereArgs: <String>[ CourseType.AdvisingCourse.index.toString() ] ), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot< List<Course> > snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = ListView.builder(
              itemCount: snapshot.data!.length+1,
              itemBuilder: (context,index){
                if(index >= snapshot.data!.length){
                  return Padding( padding: EdgeInsets.only(bottom: 50), );
                }
                return  singleList(snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            child = Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ]),
            );
          } else {
            child = Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ]),
            );
          }
          return child;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed( "/advising-course/create" );
        },
      ),
    );
  }
}
