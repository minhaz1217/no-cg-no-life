import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/dao_models/CourseDAO.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/repository/base_repository_impl.dart';
import 'package:no_cg_no_life_app/repository/sqlite_database_repository_impl.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/models/FormTextFieldMustHave.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_text_field/generic_text_field.dart';

// CreateAdvisingCourse Creates or Updates ( sent model isn't null ) an advising course

class CreateAdvisingCourse extends StatefulWidget {
  @override
  _CreateAdvisingCourseState createState() => _CreateAdvisingCourseState();
}

class _CreateAdvisingCourseFormControllers{

  FormTextFieldMustHave courseCodeTextFieldController;
  FormTextFieldMustHave sectionTextFieldController;
  FormTextFieldMustHave facultyTextFieldController;
  _CreateAdvisingCourseFormControllers( { String defaultCourseCode = "", int defaultSection = 0, String defaultFaculty = "" } ):
    this.courseCodeTextFieldController =  FormTextFieldMustHave( controller: TextEditingController( text: defaultCourseCode ) ),
    this.sectionTextFieldController  = FormTextFieldMustHave( controller: TextEditingController( text: defaultSection.toString() ) ) ,
    this.facultyTextFieldController =  FormTextFieldMustHave(controller: TextEditingController( text: defaultFaculty ))
  {
    initiateValidators();
  }
  // initializing all the validators from here, so that we won't have to search for them in the widget tree below.
  void initiateValidators(){
    this.courseCodeTextFieldController.validator = (value){
      String courseCode = value.toString().trim();
      if( courseCode.length == 0 ){
        return "Enter course code.";
      }else if(courseCode.length > 10){
        return "Code should be between 1-10";
      }
      return null;
    };

    this.sectionTextFieldController.validator = (value){
      String section = value.toString().trim();
      if(section.isEmpty){
        return "Can't be empty";
      }else if(int.tryParse(value) == null){
        return "Must be a number";
      }
      return null;
    };

    this.facultyTextFieldController.validator = (value){
      String facultyInitials = value.toString().trim();
      if(facultyInitials.length > 10){
        return "Faculty initials should be between 0-10";
      }
      return null;
    };
  }
    void dispose(){
      this.courseCodeTextFieldController.dispose();
      this.sectionTextFieldController.dispose();
      this.facultyTextFieldController.dispose();
    }
}

class _CreateAdvisingCourseState extends State<CreateAdvisingCourse> {
  late GlobalKey<FormState> _formKey;
  late Course advisingCourse;
  late _CreateAdvisingCourseFormControllers controllers;
  late Map<String, bool> dayOfTheWeekCheckBoxMap;
  late bool bothDayTimeSame;

  _CreateAdvisingCourseState(){
    this._formKey = GlobalKey<FormState>();
    this.advisingCourse = Course();
    this.controllers = _CreateAdvisingCourseFormControllers( defaultCourseCode: advisingCourse.code, defaultFaculty: advisingCourse.faculty, defaultSection: advisingCourse.section );
    this.dayOfTheWeekCheckBoxMap = Map<String,bool>();
    this.bothDayTimeSame = true;

    DayOfTheWeek.values.forEach((e){
      if(e != DayOfTheWeek.NULLDAY){
        dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(e) ] = false;
      }
    });
  }

  toggleDayOfTheWeek(String key){
    int counter = 0;
    String lastEnabledKey = "";
    dayOfTheWeekCheckBoxMap.forEach((key2, value) {
      if(value == true){
        counter++;
        lastEnabledKey = key2;
      }
    });
    if(counter >= 2 && dayOfTheWeekCheckBoxMap[key] == false){
      dayOfTheWeekCheckBoxMap[lastEnabledKey] = false;
    }
    dayOfTheWeekCheckBoxMap[key] = dayOfTheWeekCheckBoxMap[key] == true ? false : true;

    counter = 0;
    dayOfTheWeekCheckBoxMap.forEach((key, value) {
      if(value == true){
        counter++;
        if(counter == 1){
          advisingCourse.weekDay1.weekDay = StringToDayOfTheWeek(key);
        }else if(counter == 2){
          advisingCourse.weekDay2.weekDay = StringToDayOfTheWeek(key);
        }
      }
    });


  }


  // TODO: try to generalize this function so that we can generate list from the enum directly, and remove some enums if we want.
  // TODO: try to make these outlinedButton UI more like a enable/disable button.
  // generating checkboxes for the day selector.
  List<Widget> generateWeekDayPicker(){
    List<Widget> weekDaysWidget = List<Widget>.empty(growable: true);
    dayOfTheWeekCheckBoxMap.forEach((key, value){
      bool currentValue = dayOfTheWeekCheckBoxMap[key]!;
      weekDaysWidget.add(
          Container(
            margin: EdgeInsets.only(right: 4),
            child: OutlinedButton.icon(
                icon: Icon( currentValue? Icons.check_circle : Icons.check_circle_outline),
                label: Text("$key"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: (){
                  toggleDayOfTheWeek(key);
                    setState(() {});
                },
            ),
          )
      );
    }
    );

    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Select week day"),
      ),
      Container(
        height: 50,
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: weekDaysWidget ,
        ),
      )
    ];

  }

  // this triggers the time picker, it return 2 values, first one is the picked time, second one is the varification that the user did pick a time.
  Future<List> showTimePicker(BuildContext context, DateTime start) async {
    DateTime output = start;
    bool picked = false;
    await DatePicker.showTime12hPicker(
      context,
      showTitleActions: true,
      onChanged: (date) {},
      onConfirm: (date) {
        output = date;
        picked = true;
      },
      onCancel: (){
        output = start;
        picked = false;
      },
      currentTime: start,
    );
    return [output, picked];
  }

  String convertDateTimeToAMPMTime(DateTime dateTime){
    return (DateFormat('hh:mm a').format(dateTime));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( T(context)!.createAdvisingCourse),
        elevation: 0,
      ),
      
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            GenericTextField(
              textEditingController: this.controllers.courseCodeTextFieldController.controller,
              validator: this.controllers.courseCodeTextFieldController.validator,
              hintText:   T(context)!.createAdvisingCourseCourseCodeHint,
            ),
            GenericTextField(
              textEditingController: this.controllers.sectionTextFieldController .controller,
              validator: this.controllers.sectionTextFieldController.validator,
              hintText:   T(context)!.createAdvisingCourseSectionHint,
              keyboardType: TextInputType.number,
            ),
            GenericTextField(
              textEditingController: this.controllers.facultyTextFieldController.controller,
              validator: this.controllers.facultyTextFieldController.validator,
              hintText:   T(context)!.createAdvisingCourseFacultyHint,
            ),

            ...generateWeekDayPicker(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text( DayOfTheWeekToString(advisingCourse.weekDay1.weekDay) ),
                  OutlinedButton(
                    child: Text(convertDateTimeToAMPMTime(advisingCourse.weekDay1.startTime)),
                    onPressed: () async {
                      var finalTime = await showTimePicker(context, advisingCourse.weekDay1.startTime);
                      if(finalTime[1] == true){
                        advisingCourse.weekDay1.startTime = finalTime[0];
                        if(bothDayTimeSame){
                          advisingCourse.weekDay2.startTime = finalTime[0];
                        }
                        setState(() {});
                      }
                    },
                  ),
                  Icon(Icons.arrow_right_alt),
                  OutlinedButton(
                    child: Text(convertDateTimeToAMPMTime(advisingCourse.weekDay1.endTime)),
                    onPressed: () async {
                      var finalTime = await showTimePicker(context, advisingCourse.weekDay1.endTime);
                      if(finalTime[1] == true){
                        advisingCourse.weekDay1.endTime = finalTime[0];
                        if(bothDayTimeSame){
                          advisingCourse.weekDay2.endTime = finalTime[0];
                        }
                        setState(() {});
                      }
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text( DayOfTheWeekToString(advisingCourse.weekDay2.weekDay) ),
                  OutlinedButton(
                    child: Text(convertDateTimeToAMPMTime(advisingCourse.weekDay2.startTime)),
                    onPressed: () async {
                      var finalTime = await showTimePicker(context, advisingCourse.weekDay2.startTime);
                      if(finalTime[1] == true){
                        advisingCourse.weekDay2.startTime = finalTime[0];
                        if(bothDayTimeSame){
                          advisingCourse.weekDay1.startTime = finalTime[0];
                        }
                        setState(() {});
                      }
                    },
                  ),
                  Icon(Icons.arrow_right_alt),
                  OutlinedButton(
                    child: Text(convertDateTimeToAMPMTime(advisingCourse.weekDay2.endTime)),
                    onPressed: () async {
                      var finalTime = await showTimePicker(context, advisingCourse.weekDay2.endTime);
                      if(finalTime[1] == true){
                        advisingCourse.weekDay2.endTime = finalTime[0];
                        if(bothDayTimeSame){
                          advisingCourse.weekDay1.endTime = finalTime[0];
                        }
                        setState(() {});
                      }
                    },
                  )
                ],
              ),
            ),
            CheckboxListTile(
              title: Text("Both days' time same: "),
              value: bothDayTimeSame,
              onChanged: (val){
                bothDayTimeSame = bothDayTimeSame== true? false : true;
                setState(() {});
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // we are not checking anything here, because we've already checked them in the validator.
            String courseCode = controllers.courseCodeTextFieldController.controller.text.trim();
            String faculty = controllers.facultyTextFieldController.controller.text.trim();
            int section = int.parse(controllers.sectionTextFieldController.controller.text.trim()) ;
            advisingCourse.code = courseCode;
            advisingCourse.faculty = faculty;
            advisingCourse.section = section;

            // TODO: use dependency resolve.
            BaseRepository<Course> courseRepository = Get.find();

            // here at first we try to create, if that fails because of unique id constraint, then we try to update.
            try{
              var output = await courseRepository.create(advisingCourse);
            }catch(ex){
              if(ex is DatabaseException && ex.isUniqueConstraintError()){
                try{
                  var output = await courseRepository.update(advisingCourse);
                }catch(ex){
                  print(ex);
                }
              }else{
                print(ex);
              }
            }
          }
        },
      ),
    );
  }
}
