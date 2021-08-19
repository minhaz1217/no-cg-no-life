import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';

class AdvisingHelperNoConflictSchedulingView extends StatefulWidget {
  List<String> selectedCourses;
  int numberOfCourses;
  AdvisingHelperNoConflictSchedulingView( { required this.selectedCourses, required this.numberOfCourses} );

  @override
  _AdvisingHelperNoConflictSchedulingViewState createState() => _AdvisingHelperNoConflictSchedulingViewState();
}

class _AdvisingHelperNoConflictSchedulingViewState extends State<AdvisingHelperNoConflictSchedulingView> {
  BaseRepository<Course> repository = Get.find();



  List<List<Course>> getConflictFreeCourses( List<Course> courses, int totalCourses ){
    List<List<Course> > allConflictFreeCourses = List< List<Course> >.empty(growable: true);
    if(courses.isEmpty){
      return allConflictFreeCourses;
    }
    List<bool> visited = new List<bool>.filled(courses.length, false);
    List<Course> allCourses = courses;
    List< List<Course> > finalCourses = new List< List<Course> >.empty(growable: true);
    List<Course> emptyList = new List<Course>.empty(growable: true);

    void dfs(List<Course> list, int totalCourses){
      if(list.length == totalCourses){
        finalCourses.add(list);
        return;
      }

      // detectCourseListConflict detects both same code conflict and same time conflict
      bool detectCourseListConflict( List<Course> currentList, Course nextCourse ){
        bool detectCourseTimeConflict(Course course1, Course course2, [bool matchBothDays = true]){
          bool courseDayConflicts(CourseDay day1, CourseDay day2){
            // day1's start time is between day2's time.
            if( (day1.startTime.isAfter( day2.startTime ) && day1.startTime.isBefore(day2.endTime))
                || (day1.endTime.isAfter(day2.startTime) && day1.endTime.isBefore(day2.endTime))
                || (day2.startTime.isAfter(day1.startTime ) && day2.startTime.isBefore(day1.endTime))
                || (day2.endTime.isAfter(day1.startTime) && day2.endTime.isBefore(day1.endTime))
            ){
              return true;
            }
            return false; // no conflict
          }

          if(courseDayConflicts( course1.weekDay1, course2.weekDay1 )){
            return true;
          }

          if(matchBothDays &&
              courseDayConflicts(course1.weekDay1, course2.weekDay2)
              || courseDayConflicts(course1.weekDay2, course2.weekDay1)
              || courseDayConflicts(course1.weekDay2, course2.weekDay2)
          ){
            return true;
          }
          return false; // no conflict detected
        }

        for(int i=0;i<currentList.length;i++){
          if( currentList[i].code == nextCourse.code || currentList[i].name == nextCourse.name || detectCourseTimeConflict(currentList[i], nextCourse)){
            return true;
          }
        }
        return false; // no conflict
      }

      for(int i=0;i<allCourses.length;i++){
        if(!visited[i]){
          if(!detectCourseListConflict(list, allCourses[i])){
            visited[i] = true;
            list.add(allCourses[i]);
            dfs(list, totalCourses);
            visited[i] = false;
          }
        }
      }

    }

    dfs(emptyList, 3);
    for(int i=0;i<finalCourses.length;i++) {
      print("List number ${i+1}");
      finalCourses[i].forEach((element2) {
        print(element2);
      });
    }
    print("Number Of Courses : ${totalCourses}");
    return allConflictFreeCourses;
  }


  Widget makeCourseList(List<Course> courses){
    print("COURSE LIST ALL");
    courses.forEach((element) {
      print(element);
    });
    return Card(
      child: Text("Testing"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( T(context)!.conflictFreeSchedule),
          elevation: 0,
        ),
        body:
        FutureBuilder< List<Course> >(
          future: repository.getAll( where: "code in (${widget.selectedCourses.map((e) => "'$e'").join(', ')})"),
          builder: (BuildContext context, AsyncSnapshot< List<Course> > snapshot) {
            Widget child;
            if (snapshot.hasData) {
              print("All Courses: ${snapshot.data!.length}" );
              var data = getConflictFreeCourses( snapshot.data??List<Course>.empty(), widget.numberOfCourses );
              print("RESOLVE FREE ${data.length}");
              child =
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return makeCourseList(data[index]);
                      },
                    ),
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
        )
    );
  }
}
