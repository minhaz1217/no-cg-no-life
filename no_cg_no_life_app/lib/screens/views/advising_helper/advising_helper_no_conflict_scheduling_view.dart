import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';

class AdvisingHelperNoConflictSchedulingView extends StatefulWidget {
  List<String> selectedCourses;
  AdvisingHelperNoConflictSchedulingView( { required this.selectedCourses} );

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


    bool detectCourseConflict(Course course1, Course course2){

      var course1Hour = course1.weekDay1.startTime;

      // if(course1.weekDay1.startTime.isAfter(other))

      return false; // no conflict detected
    }
    bool detectConflict( List<Course> currentList, Course nextCourse ){
      for(int i=0;i<currentList.length;i++){
        var u = currentList[i];
        var v = nextCourse;

        // if(u.weekDay1)

      }
      return true;
    }
    void dfs(List<Course> list, int totalCourses, List< List<Course> > finalCourses){
      if(list.length == totalCourses){
        finalCourses.add(list);
      }

    }



    return allConflictFreeCourses;
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
              var data = getConflictFreeCourses( snapshot.data??List<Course>.empty(), 5 );

              child =
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      children: [
                      ],
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
