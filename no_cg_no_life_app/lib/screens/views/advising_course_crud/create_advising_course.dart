import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  _CreateAdvisingCourseState(){
    this._formKey = GlobalKey<FormState>();
    this.controllers = _CreateAdvisingCourseFormControllers();
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
