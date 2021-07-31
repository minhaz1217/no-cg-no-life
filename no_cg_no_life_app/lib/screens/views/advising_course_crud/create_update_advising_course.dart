import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/enums/CourseUseageType.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/enums/InsertType.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/helpers/common_snackbar.dart';
import 'package:no_cg_no_life_app/helpers/date_helper.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:no_cg_no_life_app/models/FormTextFieldMustHave.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_text_field/generic_text_field.dart';

// CreateAdvisingCourse Creates or Updates ( sent model isn't null ) an advising course

class CreateOrUpdateAdvisingCourse extends StatefulWidget {
  final Course? course;
  CreateOrUpdateAdvisingCourse({this.course});
  @override
  _CreateOrUpdateAdvisingCourseState createState() => _CreateOrUpdateAdvisingCourseState();
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

class _CreateOrUpdateAdvisingCourseState extends State<CreateOrUpdateAdvisingCourse> {
  late GlobalKey<FormState> _formKey;
  late Course advisingCourse;
  late _CreateAdvisingCourseFormControllers controllers;
  late Map<String, bool> dayOfTheWeekCheckBoxMap;
  late bool bothDayTimeSame;
  late BaseRepository<Course> courseRepository;
  @override
  initState(){
    this._formKey = GlobalKey<FormState>();

    courseRepository = Get.find();

    // Checking if this is create or edit operation.
    if(widget.course == null){
      this.advisingCourse = Course();
      this.advisingCourse.weekDay1.startTime = this.advisingCourse.weekDay2.startTime;
      this.advisingCourse.weekDay1.endTime = this.advisingCourse.weekDay2.endTime;
      this.advisingCourse.weekDay1.weekDay = DayOfTheWeek.Sunday;
      this.advisingCourse.weekDay2.weekDay = DayOfTheWeek.Tuesday;
      this.advisingCourse.courseEntryType = CourseEntryType.ManualEntry;
      this.advisingCourse.courseUsageType = CourseUsageType.AdvisingCourse;
    }else{
      this.advisingCourse = widget.course!;
    }

    // creating controllers for the text boxes
    this.controllers = _CreateAdvisingCourseFormControllers( defaultCourseCode: advisingCourse.code, defaultFaculty: advisingCourse.instructor, defaultSection: advisingCourse.section );
    this.bothDayTimeSame = true;



    this.dayOfTheWeekCheckBoxMap = Map<String,bool>();
    // TODO: try to improve this using loop and maybe mod? %8?
    // had to do it like this because of custom sorting
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Sunday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Monday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Tuesday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Wednesday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Thursday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Friday) ] = false;
    dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(DayOfTheWeek.Saturday) ] = false;

    dayOfTheWeekCheckBoxMap.forEach((key, value) {
      if(key == DayOfTheWeekToString( advisingCourse.weekDay1.weekDay ) || key == DayOfTheWeekToString( advisingCourse.weekDay2.weekDay )){
        dayOfTheWeekCheckBoxMap[key] = true;
      }
    });

    // DayOfTheWeek.values.forEach((dayOfWeek){
    //   if(dayOfWeek != DayOfTheWeek.NULLDAY){
    //     if(dayOfWeek == advisingCourse.weekDay1.weekDay || dayOfWeek == advisingCourse.weekDay2.weekDay){
    //       dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(dayOfWeek) ] = true;
    //     }else{
    //       dayOfTheWeekCheckBoxMap[ DayOfTheWeekToString(dayOfWeek) ] = false;
    //     }
    //   }
    // });
    super.initState();
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
        child: Text("Select week day"), // TODO: translation
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
        title: Text(  widget.course == null ?  T(context)!.createAdvisingCourse : T(context)!.updateAdvisingCourse),
        elevation: 0,
        actions: [
          widget.course != null ?
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              // TODO: on delete, show a confirmation dialog then delete on confirm
              try{
                await courseRepository.delete(advisingCourse);
                Navigator.pop(context);
                // showSuccess("Success", "Deleted successfully.");
              }catch(ex){
                showError(ex);
              }
            },
          ):Container()

        ],
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
                        advisingCourse.weekDay1.startTime = removeDateKeepAMPMTime(finalTime[0]);
                        if(bothDayTimeSame){
                          advisingCourse.weekDay2.startTime = removeDateKeepAMPMTime(finalTime[0]);
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
                        advisingCourse.weekDay2.startTime = removeDateKeepAMPMTime(finalTime[0]);
                        if(bothDayTimeSame){
                          advisingCourse.weekDay1.startTime = removeDateKeepAMPMTime(finalTime[0]);
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
              title: Text("Both days' time same: "), // TODO: translation
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
            advisingCourse.instructor = faculty;
            advisingCourse.section = section;


            // here at first we try to create, if that fails because of unique id constraint, then we try to update.
            try{
              var output = await courseRepository.create(advisingCourse);
              showSnackBar(title:  "Success",message:  "Course created successfully.", backgroundColor: SuccessColor ); // TODO: translation
            }catch(ex){
              if(ex is DatabaseException && ex.isUniqueConstraintError()){
                try{
                  var output = await courseRepository.update(advisingCourse);
                  showSnackBar(title:  "Success", message: "Course updated successfully." , backgroundColor: SuccessColor); // TODO: translation
                }catch(ex){
                  showError(ex);
                }
              }else{
                showError(ex);
              }
            }
          }
        },
      ),
    );
  }
}
