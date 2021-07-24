import 'package:flutter/material.dart';

class AdvisingHelperHelpView extends StatefulWidget {
  List<String> selectedCourses;
  AdvisingHelperHelpView( { required this.selectedCourses} );

  @override
  _AdvisingHelperHelpViewState createState() => _AdvisingHelperHelpViewState();
}

class _AdvisingHelperHelpViewState extends State<AdvisingHelperHelpView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text( widget.selectedCourses.length.toString() ),
    );
  }
}
