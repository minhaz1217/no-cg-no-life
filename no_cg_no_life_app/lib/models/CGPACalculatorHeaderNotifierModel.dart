import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


// CGPACalculatorHeaderNotifierModel is used to notify the credit and cgpa sliders about changes and let them restart their animation
class CGPACalculatorHeaderNotifierModel extends Model{
  double finalCredit;
  double finalCGPA;
  CGPACalculatorHeaderNotifierModel({ this.finalCGPA = 0, this.finalCredit = 0 });

  // this is used to get this model from the widget tree and listen to its value changes.
  static CGPACalculatorHeaderNotifierModel of(BuildContext context) => ScopedModel.of<CGPACalculatorHeaderNotifierModel>(context);
}