
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/enums/CourseUseageType.dart';
import 'package:no_cg_no_life_app/enums/InsertType.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/FormTextFieldMustHave.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_text_field/generic_text_field.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/action_button.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/expandable_fab.dart';

class AdvisingHelperView extends StatefulWidget {
  @override
  _AdvisingHelperViewState createState() => _AdvisingHelperViewState();
}

class _AdvisingHelperViewState extends State<AdvisingHelperView> {
  BaseRepository<Course> repository = Get.find();
  var _kOptions = List<Course>.empty( growable: true );
  var selectedCourseCodes = List<String>.empty(growable: true);
  bool _fromManualEntry = false;
  late GlobalKey<FormState> _formKey;
  late FormTextFieldMustHave numberOfCoursesInputMustHave;
  _AdvisingHelperViewState(){
    numberOfCoursesInputMustHave = new FormTextFieldMustHave(
        controller: TextEditingController( text: 3.toString() ));
    initiateValidators();
  }

  void initiateValidators(){
    this.numberOfCoursesInputMustHave.validator = (value){
      String strNumberOfCourses = value.toString().trim();
      if(strNumberOfCourses.isEmpty){
        return "Can't be empty";
      }else if(int.tryParse(value) == null){
        return "Must be a number";
      }
      return null;
    };
  }

  @override
  void initState() {
    this._formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int? _value = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text( T(context)!.advisingHelper),
        elevation: 0,
      ),
      body:
      FutureBuilder< List<Course> >(
        future: repository.getAll( where: "course_usage_type = ?" , whereArgs: [ CourseUsageType.AdvisingCourse.index.toString() ],  distinct: true, columns: [ "code", "course_entry_type" ] ),
        builder: (BuildContext context, AsyncSnapshot< List<Course> > snapshot) {
          Widget child;
          if (snapshot.hasData) {
            // print(snapshot.data!.length.toString());
            // print(snapshot.data!);
            List<Course> distinctCourses = List<Course>.empty(growable: true);
            for(int i=0;i<snapshot.data!.length;i++){
              bool found = false;
              for(int j=0;j<distinctCourses.length;j++){
                if(distinctCourses[j].code == snapshot.data![i].code){
                  found = true;
                  break;
                }
              }
              if(found == false  ){
                if(_fromManualEntry && snapshot.data![i].courseEntryType == CourseEntryType.ManualEntry){
                  distinctCourses.add( snapshot.data![i] );
                }else if(!_fromManualEntry && snapshot.data![i].courseEntryType == CourseEntryType.AutomaticEntry){
                  distinctCourses.add( snapshot.data![i] );
                }
              }
            }
            
            child =
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      children: [
                        Autocomplete<Course>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return distinctCourses.where((Course option) {
                              bool eval =
                              option.code.contains(textEditingValue.text.toUpperCase()) &&
                                  !selectedCourseCodes.contains(option.code)
                              ;
                              return eval;
                            }).toList();
                          },
                          displayStringForOption: (Course course){
                            return course.code;
                          },
                          onSelected: (Course selection) {
                            setState(() {
                              // we only select the one that isn't already selected.
                              if(!selectedCourseCodes.contains(selection)){
                                selectedCourseCodes.add(selection.code);
                              }
                            });
                          },
                        ),
                        GenericTextField(
                          keyboardType: TextInputType.number,
                          hintText: "Number of courses",
                          textEditingController: numberOfCoursesInputMustHave.controller,
                          validator: numberOfCoursesInputMustHave.validator,
                          padding: EdgeInsets.only(top: 8),
                        ),

                        CheckboxListTile(
                            title: Text("Select from manual entry? : "),
                            value: _fromManualEntry,
                            onChanged: (val){
                              setState(() {
                                _fromManualEntry = !_fromManualEntry;
                                selectedCourseCodes.clear();
                              });
                            }),

                        Wrap(
                          children: List<Widget>.generate(
                            selectedCourseCodes.length,
                                (int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InputChip(
                                  label: Text('${selectedCourseCodes.elementAt(index)}'),
                                  elevation: 4,
                                  selected: true,
                                  onPressed: (){
                                    setState(() {
                                      selectedCourseCodes.remove(selectedCourseCodes.elementAt(index));
                                    });
                                  },
                                ),
                              );
                            },
                          ).toList(),
                        )
                      ],
                    ),
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
      ),


      floatingActionButton: ExpandableFab(
        distance: 80.0,
        children: [
          ActionButton(
            onPressed: () {

              if (_formKey.currentState!.validate()) {
                Map <String, dynamic> data= {
                  "selectedCourses": selectedCourseCodes,
                  "numberOfCourses" : int.tryParse(this.numberOfCoursesInputMustHave.controller.text)
                };
                Navigator.of(context).pushNamed( "/advising-helper/help", arguments: data );
              }

            },
            icon: const Icon(Icons.done),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed( "/advising-course/list" );
            },
            icon: const Icon(Icons.view_list),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed( "/advising-course/create" );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );

  }
}








