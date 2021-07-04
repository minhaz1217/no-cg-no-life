
import 'package:no_cg_no_life_app/configs/static_datas.dart';

double convertLetterGradeToGradePoint(String grade){
  for(int i=0;i<StaticDatas.LetterGrades.length;i++){
    if(StaticDatas.LetterGrades[i] == grade){
      return StaticDatas.PointGrades[i];
    }
  }
  return StaticDatas.PointGrades.last;
}
String convertGradePointToLetterGrade(double gradePoint){
  for(int i=0;i<StaticDatas.PointGrades.length;i++){
    if(StaticDatas.PointGrades[i] == gradePoint){
      return StaticDatas.LetterGrades[i];
    }
  }
  return StaticDatas.LetterGrades.last;
}