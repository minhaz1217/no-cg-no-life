import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
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
    this.facultyTextFieldController =  FormTextFieldMustHave(controller: TextEditingController( text: defaultFaculty )) {
    initiateValidators();
  }
  // initializing all the validators from here, so that we won't have to search for them in the widget tree below.
  void initiateValidators(){
    this.courseCodeTextFieldController.validator = (value){
      String courseCode = value.toString();
      if( courseCode.length == 0 ){
        return "Enter course code.";
      }else if(courseCode.length > 10){
        return "Code should be between 1-10";
      }
      return null;
    };

    this.sectionTextFieldController.validator = (value){
      return null;
    };

    this.facultyTextFieldController.validator = (value){
      String facultyInitials = value.toString();
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
  late _CreateAdvisingCourseFormControllers controllers;
  late Map<String, bool> dayOfTheWeekCheckBoxMap;

  _CreateAdvisingCourseState(){
    this._formKey = GlobalKey<FormState>();
    this.controllers = _CreateAdvisingCourseFormControllers();
    dayOfTheWeekCheckBoxMap = Map<String,bool>();
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
  }


  // TODO: try to generalize this function so that we can generate list from the enum directly, and remove some enums if we want.
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
            ),
            GenericTextField(
              textEditingController: this.controllers.facultyTextFieldController.controller,
              validator: this.controllers.facultyTextFieldController.validator,
              hintText:   T(context)!.createAdvisingCourseFacultyHint,
            ),
            ...generateWeekDayPicker(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){
          if (_formKey.currentState!.validate()) {

          }
        },
      ),
    );
  }
}
