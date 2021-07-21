
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/localization_helper.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/action_button.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/expandable_fab.dart';

class AdvisingHelperView extends StatefulWidget {
  @override
  _AdvisingHelperViewState createState() => _AdvisingHelperViewState();
}

class _AdvisingHelperViewState extends State<AdvisingHelperView> {
  BaseRepository<Course> repository = Get.find();
  var _kOptions = List<String>.empty( growable: true );
  var selectedCourseCodes = List<String>.empty(growable: true);

  @override
  void initState() {
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
        future: repository.getAll(),
        builder: (BuildContext context, AsyncSnapshot< List<Course> > snapshot) {
          Widget child;
          if (snapshot.hasData) {
            // filling the autocomplete options. and only taking unique ones
            snapshot.data!.forEach((element) {
              if(!_kOptions.contains( element.code.toLowerCase() )){
                _kOptions.add(element.code.toLowerCase());
              }
            });
            child =
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: [
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          return _kOptions.where((String option) {
                            return option.contains(textEditingValue.text.toLowerCase()) && !selectedCourseCodes.contains(option);
                          });
                        },
                        onSelected: (String selection) {
                          setState(() {
                            // we only select the one that isn't already selected.
                            if(!selectedCourseCodes.contains(selection)){
                              selectedCourseCodes.add(selection);
                            }
                          });
                        },
                      ),
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
              Navigator.of(context).pushNamed( "/advising-helper/help", arguments: selectedCourseCodes );
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








