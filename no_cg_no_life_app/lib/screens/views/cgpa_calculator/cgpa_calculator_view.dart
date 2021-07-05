import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/configs/static_datas.dart';
import 'package:no_cg_no_life_app/helpers/cgpa_helper.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/models/CGPACalculatorModel.dart';
import 'package:no_cg_no_life_app/screens/views/cgpa_calculator/components/cgpa_calculator_header_section.dart';
import 'package:no_cg_no_life_app/screens/views/cgpa_calculator/components/cgpa_calculator_text_field.dart';

class CGPACalculatorView extends StatefulWidget {
  @override
  _CGPACalculatorViewState createState() => _CGPACalculatorViewState();
}

// holds the 3 controller needed to calculate each of the row for a calculation
class _CourseTextFieldController{
  TextEditingController courseTextField;
  TextEditingController creditsTextField;
  TextEditingController cgpaTextField;
  _CourseTextFieldController( { required this.courseTextField ,required this.creditsTextField, required this.cgpaTextField } );
  dispose(){
    courseTextField.dispose();
    creditsTextField.dispose();
    cgpaTextField.dispose();
  }
}

class _CGPACalculatorViewState extends State<CGPACalculatorView> {
  List<_CourseTextFieldController> coursesControllers = <_CourseTextFieldController>[];
  late _CourseTextFieldController historyTextFieldsController;
  late CGPACalculatorModel model;
  late GlobalKey<FormState> _formKey;


  _CGPACalculatorViewState(){
    _formKey = GlobalKey<FormState>();
    this.model = CGPACalculatorModel();
    // TODO: load already saved data from shared_pref

    // making data for the history row and initializing its text controllers
    this.model.history = CGPATextModel(courseName: "Previous", cgpa: 0,credit: 0);
    this.historyTextFieldsController = _CourseTextFieldController(
        courseTextField: TextEditingController( text: this.model.history.courseName ) ,
        creditsTextField: TextEditingController(text: this.model.history.credit.toString()) ,
        cgpaTextField: TextEditingController(text: this.model.history.cgpa.toString())
    );

    // if there isn't any courses already added, we'll create 3 dummy data.
    if(this.model.currentCourses.length <= 0){
      for(int i=0;i<3;i++){
        this.model.currentCourses.add( CGPATextModel(
          courseName: "Course ${i+1}",
          credit: 3,
          cgpa: 4
        ) );
        coursesControllers.add(
            _CourseTextFieldController(
                courseTextField: TextEditingController( text: this.model.currentCourses.last.courseName ) ,
                creditsTextField: TextEditingController(text: this.model.currentCourses.last.credit.toString()) ,
                cgpaTextField: TextEditingController(text: this.model.currentCourses.last.cgpa.toString()))
        );
      }
    }
  }

  calculateCGPA(){
    if (_formKey.currentState!.validate()) {
      double historyCGPA = 0, historyCredit = 0;
      print(historyTextFieldsController.cgpaTextField.text);
      print(double.tryParse(historyTextFieldsController.cgpaTextField.text.trim()));
      if(double.tryParse(historyTextFieldsController.cgpaTextField.text.trim()) != null){
        historyCGPA = double.tryParse(historyTextFieldsController.cgpaTextField.text.trim())!;
      }else{
        // TODO: handle these errors.
        throw Exception("CGPA is invalid");
      }

      if(double.tryParse(historyTextFieldsController.creditsTextField.text.trim()) != null){
        historyCredit = double.tryParse(historyTextFieldsController.creditsTextField.text.trim())!;
      }else{
        throw Exception("Credit is invalid");
      }

      if(historyCGPA < 0 || historyCGPA > 4.00){
        throw Exception( "CGPA should be between 0 and 4 inclusive." );
      }


      double finalCGPA = historyCGPA * historyCredit;
      double totalCredits = historyCredit;
      for(int i=0;i<model.currentCourses.length;i++){
        finalCGPA += model.currentCourses[i].credit * model.currentCourses[i].cgpa;
        totalCredits += model.currentCourses[i].credit;
      }
      finalCGPA = finalCGPA/totalCredits.roundToDouble();
      finalCGPA = double.parse(finalCGPA.toStringAsFixed(2));
      // TODO: now add the circular progression with animation to show this.
      print("FINAL CGPA ${finalCGPA}");
    }
  }

  addNewCourse(){
    int index = model.currentCourses.length;
    this.model.currentCourses.add( CGPATextModel(
        courseName: "Course ${index + 1}",
        credit: 3,
        cgpa: 4
    ) );
    coursesControllers.add(
        _CourseTextFieldController(
            courseTextField: TextEditingController( text: this.model.currentCourses.last.courseName ) ,
            creditsTextField: TextEditingController(text: this.model.currentCourses.last.credit.toString()) ,
            cgpaTextField: TextEditingController(text: this.model.currentCourses.last.cgpa.toString()))
    );
  }
  removeCourse(int index){
    this.model.currentCourses.removeAt(index);
    this.coursesControllers.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {

    Widget generateTextFieldsForHistory(){
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: CGPACalculatorTextField(
              hintText: "Previous",
              readOnly: true,
              textEditingController: historyTextFieldsController.courseTextField,
            ),
          ),
          Expanded(
            flex: 2,
            child: CGPACalculatorTextField(
                hintText: "Credits",
                readOnly: false,
                textEditingController: historyTextFieldsController.creditsTextField,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Empty";
                  }else if(double.tryParse(value) == null){
                    return "Invalid";
                  }else if( double.tryParse(value)! < 0 || double.tryParse(value)! >200 ){
                    return "0-200 allowed";
                  }
                  return null;
                },
            ),
          ),
          Expanded(
            flex: 2,
            child: CGPACalculatorTextField(
              hintText: "CGPA",
              readOnly: false,
              textEditingController: historyTextFieldsController.cgpaTextField,
              keyboardType: TextInputType.number,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Empty";
                }else if(double.tryParse(value) == null){
                  return "Invalid";
                }else if( double.tryParse(value)! < 0 || double.tryParse(value)! >4 ){
                  return "0-4 allowed";
                }
                return null;
              }
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              color: ErrorColor,
              icon: Icon(Icons.close_outlined),
              onPressed: null,
            ),
          )
        ],
      );
    }

    List<Widget> generateDataInputingRows(){
      var output = <Widget>[];
      for(int i=0;i<this.model.currentCourses.length;i++){
        var currentCourse = this.model.currentCourses[i];
        output.add(Row(
          children: [
            Expanded(
              flex: 2,
              child: CGPACalculatorTextField(hintText: currentCourse.courseName, textEditingController:  coursesControllers[i].courseTextField ,),
            ),
            Expanded(
              flex: 2,
              child: DropdownButton<double>(
                value: currentCourse.credit,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                isExpanded: true,
                elevation: 16,
                underline: Container(),
                onChanged: (double? newValue) {
                  if(newValue != null){
                    setState(() {
                      currentCourse.credit = newValue;
                    });
                  }
                },
                items: StaticDatas.CreditsList.map<DropdownMenuItem<double>>((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Center(
                      child: Text(value.toString(), textAlign: TextAlign.center,),
                    ),
                  );
                }).toList(),
              ),
            ),

            Expanded(
              flex: 2,
              child: DropdownButton<String>(
                value: convertGradePointToLetterGrade(currentCourse.cgpa),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                isExpanded: true,
                elevation: 16,
                underline: Container(),
                onChanged: (String? newValue) {
                  if(newValue != null){
                    setState(() {
                      currentCourse.cgpa =  convertLetterGradeToGradePoint(newValue) ;
                    });
                  }
                },
                items: StaticDatas.LetterGrades.map<DropdownMenuItem<String> >((String value) {
                  return DropdownMenuItem<String>(
                    value: (value),
                    child: Center(
                      child: Text(value, textAlign: TextAlign.center,),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                color: ErrorColor,
                icon: Icon(Icons.close_outlined),
                onPressed: (){
                  removeCourse(i);
                  setState(() {});
                },
              ),
            )
          ],
        ));
      }

      output.add(SizedBox(
        height: 80,
      ));
      return output;
    }
    return Scaffold(
      appBar: AppBar( title: Text("CGPA Calculator"),elevation: 0, ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            CGPACalculatorHeaderSection(),
            generateTextFieldsForHistory(),
            ...generateDataInputingRows()
          ],
        ),
      ),
      floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "leftButton",
                backgroundColor: BrandColor,
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    addNewCourse();
                  });
                },
              ),
              FloatingActionButton(
                heroTag: "rightButton",
                backgroundColor: SuccessColor,
                child: Icon(Icons.done),
                onPressed: () {
                  calculateCGPA();
                },
              )
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    historyTextFieldsController.dispose();
    for(int i=0;i<coursesControllers.length;i++){
      coursesControllers[i].dispose();
    }
    super.dispose();
  }
}
