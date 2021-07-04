import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/enums/RedirectionTypeEnum.dart';
import 'package:no_cg_no_life_app/models/CardModel.dart';
import 'package:no_cg_no_life_app/models/RedirectionCardModel.dart';

// Here we will keep some static datas, that will be used throughout the app.
// many things in here maybe loaded from json later.
class StaticDatas{
static const List<String> LetterGrades = const                [   "A+",   "A",  "A-", "B+",  "B", "B-", "C+",   "C",  "C-", "D+", "D",  "F"];
  static const List<double> PointGrades = const               [      4,     4,  3.70, 3.30, 3.30, 2.70, 2.30,  2.00,  1.70, 1.30,1.00,  0];
  static const List<double> GradeMarksInclusiveStart = const  [     97,    90,    87,   83,   80,   77,   73,    70,    67,   63,  60,  0]; // greater than or equals to this
  static const List<double> GradeMarksExclusiveEnd = const    [    101,    97,    90,   87,   83,   80,   77,    73,    70,   67,  63, 60]; // less than this
  static const List<double> CreditsList = const [ 1,2,3,4,5,6 ];

}