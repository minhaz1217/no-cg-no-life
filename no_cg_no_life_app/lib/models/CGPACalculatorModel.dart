
// Used in the cgpa calculator view, to initialize data for a new page.
class CGPACalculatorModel{
  double finalCGPA = 0;
  double finalCredits = 0;
  CGPATextModel history = CGPATextModel();
  List<CGPATextModel> currentCourses = <CGPATextModel>[];
}

// Used in the cgpa calculator view to initialize each of the row that enters course, cgpa, credit
class CGPATextModel{
  String courseName = "Course";
  double cgpa  = 0;
  double credit  = 0;
  CGPATextModel({ this.courseName = "Course", this.cgpa = 0, this.credit = 0 });
}