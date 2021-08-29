import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/services/course_service.dart';

class AdvisingHelperNoConflictSchedulingView extends StatefulWidget {
  List<String> selectedCourses;
  int numberOfCourses;
  AdvisingHelperNoConflictSchedulingView( { required this.selectedCourses, required this.numberOfCourses} );

  @override
  _AdvisingHelperNoConflictSchedulingViewState createState() => _AdvisingHelperNoConflictSchedulingViewState();
}

class _AdvisingHelperNoConflictSchedulingViewState extends State<AdvisingHelperNoConflictSchedulingView> {
  BaseRepository<Course> repository = Get.find();
  CourseService courseService = Get.find();

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
              var data = courseService.getConflictFreeCourses( snapshot.data??List<Course>.empty(), widget.numberOfCourses );
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
