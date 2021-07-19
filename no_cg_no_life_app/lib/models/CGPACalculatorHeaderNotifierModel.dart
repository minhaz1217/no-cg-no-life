import 'package:get/get.dart';

// CGPACalculatorHeaderNotifierModel is used to notify the credit and cgpa sliders about changes and let them restart their animation
class CGPACalculatorHeaderNotifierModel extends GetxController{
  RxDouble finalCredit;
  RxDouble finalCGPA;
  CGPACalculatorHeaderNotifierModel({ double finalCGPA = 0.0, double finalCredit = 0.0 }): this.finalCGPA = finalCGPA.obs, this.finalCredit = finalCredit.obs;
}