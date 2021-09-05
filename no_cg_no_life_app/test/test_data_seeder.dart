

import 'dart:convert';

import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/services/data_loader_service.dart';

Future<List<Course>> getCoursesForConflictTest(List<String> courseNames) async {
  String str = """
  {
    "summer_2021": [
  {
  "course": "CSE101",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "MAHI",
  "room_no": "225"
  },
  {
  "course": "CSE101",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "MAHI",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE101",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE101",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "AB1-702"
  },
  {
  "course": "CSE101",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "T",
  "instructor": "ALI",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE101",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "R",
  "instructor": "ALI",
  "room_no": "110"
  },
  {
  "course": "CSE101",
  "section": "4",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "S",
  "instructor": "AKD",
  "room_no": "534 (C. Lab-4)"
  },
  {
  "course": "CSE101",
  "section": "4",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "AKD",
  "room_no": "113"
  },
  {
  "course": "CSE101",
  "section": "5",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "T",
  "instructor": "SHK",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE101",
  "section": "5",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "SHK",
  "room_no": "112"
  },
  {
  "course": "CSE101",
  "section": "6",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "T",
  "instructor": "MAHI",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE101",
  "section": "6",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "S",
  "instructor": "MAHI",
  "room_no": "534 (C. Lab-4)"
  },
  {
  "course": "CSE101",
  "section": "7",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "M",
  "instructor": "MMDR",
  "room_no": "212"
  },
  {
  "course": "CSE101",
  "section": "7",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "MMDR",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE101",
  "section": "8",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE101",
  "section": "8",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "113"
  },
  {
  "course": "CSE101",
  "section": "9",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "102"
  },
  {
  "course": "CSE101",
  "section": "9",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE101",
  "section": "10",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE101",
  "section": "10",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "AB3-301"
  },
  {
  "course": "CSE101",
  "section": "11",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "M",
  "instructor": "MMSU",
  "room_no": "AB1-301"
  },
  {
  "course": "CSE101",
  "section": "11",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "W",
  "instructor": "MMSU",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE101",
  "section": "12",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "112"
  },
  {
  "course": "CSE101",
  "section": "12",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "534 (C. Lab-4)"
  },
  {
  "course": "CSE102",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "MMSR",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE102",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "M",
  "instructor": "MMSR",
  "room_no": "AB1-301"
  },
  {
  "course": "CSE103",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "TR",
  "instructor": "DAWR",
  "room_no": "102"
  },
  {
  "course": "CSE103",
  "section": "2",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "DAWR",
  "room_no": "108"
  },
  {
  "course": "CSE103",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "TJ",
  "room_no": "108"
  },
  {
  "course": "CSE103",
  "section": "4",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "SR",
  "instructor": "TJ",
  "room_no": "102"
  },
  {
  "course": "CSE103",
  "section": "5",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "SR",
  "instructor": "MYR",
  "room_no": "AB2-203"
  },
  {
  "course": "CSE103LAB",
  "section": "1",
  "time_from": "11:50",
  "time_to": "2:50",
  "weekday": "S",
  "instructor": "DAWR",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE103LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "7:50",
  "weekday": "T",
  "instructor": "DAWR",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE103LAB",
  "section": "3",
  "time_from": "4:50",
  "time_to": "7:50",
  "weekday": "M",
  "instructor": "TJ",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE103LAB",
  "section": "4",
  "time_from": "4:50",
  "time_to": "7:50",
  "weekday": "W",
  "instructor": "TJ",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE103LAB",
  "section": "5",
  "time_from": "10:10",
  "time_to": "1:10",
  "weekday": "S",
  "instructor": "MYR",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE106",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "MHAK",
  "room_no": "531"
  },
  {
  "course": "CSE106",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "ST",
  "instructor": "MHAK",
  "room_no": "531"
  },
  {
  "course": "CSE106",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "MHAK",
  "room_no": "531"
  },
  {
  "course": "CSE106",
  "section": "4",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "DSU",
  "room_no": "337"
  },
  {
  "course": "CSE106",
  "section": "4",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "T",
  "instructor": "DSU",
  "room_no": "AB1-202"
  },
  {
  "course": "CSE108",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "NYA",
  "room_no": "110"
  },
  {
  "course": "CSE108LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "R",
  "instructor": "NYA",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE110",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "S",
  "instructor": "MKR",
  "room_no": "217"
  },
  {
  "course": "CSE110",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "MKR",
  "room_no": "111"
  },
  {
  "course": "CSE110",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "TR",
  "instructor": "MDH",
  "room_no": "AB3-601"
  },
  {
  "course": "CSE110",
  "section": "3",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "S",
  "instructor": "MDH",
  "room_no": "335"
  },
  {
  "course": "CSE110",
  "section": "3",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "R",
  "instructor": "MDH",
  "room_no": "217"
  },
  {
  "course": "CSE110",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "AB1-803"
  },
  {
  "course": "CSE110",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "AB3-702"
  },
  {
  "course": "CSE110LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "T",
  "instructor": "MKR",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE110LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "7:50",
  "weekday": "W",
  "instructor": "MDH",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE110LAB",
  "section": "3",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "S",
  "instructor": "MDH",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE110LAB",
  "section": "4",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "TBA",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE200",
  "section": "1",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "TDA",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE200",
  "section": "2",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "KS",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE200",
  "section": "3",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "RRH",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE200",
  "section": "4",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "M",
  "instructor": "KS",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE200",
  "section": "5",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE207",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "MI",
  "room_no": "102"
  },
  {
  "course": "CSE207",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "MI",
  "room_no": "102"
  },
  {
  "course": "CSE207",
  "section": "3",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "AKD",
  "room_no": "AB1-401"
  },
  {
  "course": "CSE207",
  "section": "4",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "MW",
  "instructor": "TM",
  "room_no": "217"
  },
  {
  "course": "CSE207",
  "section": "5",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "RRH",
  "room_no": "AB1-601"
  },
  {
  "course": "CSE207",
  "section": "6",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "TR",
  "instructor": "TBA",
  "room_no": "AB3-801"
  },
  {
  "course": "CSE207LAB",
  "section": "1",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "MI",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE207LAB",
  "section": "2",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "R",
  "instructor": "MI",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE207LAB",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "M",
  "instructor": "AKD",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE207LAB",
  "section": "4",
  "time_from": "10:10",
  "time_to": "1:10",
  "weekday": "M",
  "instructor": "TM",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE207LAB",
  "section": "5",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "W",
  "instructor": "RRH",
  "room_no": "533 (C. Lab-3)"
  },
  {
  "course": "CSE207LAB",
  "section": "6",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "TBA",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE209",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "RDA",
  "room_no": "AB1-401"
  },
  {
  "course": "CSE209",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "ST",
  "instructor": "RDA",
  "room_no": "AB1-601"
  },
  {
  "course": "CSE209",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "MKN",
  "room_no": "220"
  },
  {
  "course": "CSE209",
  "section": "4",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "TR",
  "instructor": "SHK",
  "room_no": "AB1-201"
  },
  {
  "course": "CSE209",
  "section": "5",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "SHK",
  "room_no": "430"
  },
  {
  "course": "CSE209LAB",
  "section": "1",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "S",
  "instructor": "RDA",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE209LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "RDA",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE209LAB",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "W",
  "instructor": "MKN",
  "room_no": "548 (Electrical Circuit Lab)"
  },
  {
  "course": "CSE209LAB",
  "section": "4",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "S",
  "instructor": "SHK",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE209LAB",
  "section": "5",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "SHK",
  "room_no": "548 (Electrical Circuit Lab)"
  },
  {
  "course": "CSE227",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "DSU",
  "room_no": "222"
  },
  {
  "course": "CSE227LAB",
  "section": "1",
  "time_from": "3:10",
  "time_to": "6:10",
  "weekday": "S",
  "instructor": "DSU",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE245",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "T",
  "instructor": "JAO",
  "room_no": "AB3-502"
  },
  {
  "course": "CSE245",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "JAO",
  "room_no": "338"
  },
  {
  "course": "CSE245LAB",
  "section": "1",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "JAO",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE246",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "TJ",
  "room_no": "110"
  },
  {
  "course": "CSE246",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "RRH",
  "room_no": "AB3-602"
  },
  {
  "course": "CSE246",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "RRH",
  "room_no": "AB3-302"
  },
  {
  "course": "CSE246LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "T",
  "instructor": "TJ",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE246LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "RRH",
  "room_no": "533 (C. Lab-3)"
  },
  {
  "course": "CSE246LAB",
  "section": "3",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "RRH",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE248",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "ST",
  "instructor": "SDB",
  "room_no": "AB1-502"
  },
  {
  "course": "CSE251",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "ST",
  "instructor": "SDB",
  "room_no": "AB1-201"
  },
  {
  "course": "CSE251",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "SDB",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE251",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "SHK",
  "room_no": "AB1-601"
  },
  {
  "course": "CSE251",
  "section": "4",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "TDA",
  "room_no": "AB2-203"
  },
  {
  "course": "CSE251",
  "section": "5",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "AB3-901"
  },
  {
  "course": "CSE251",
  "section": "5",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "AB3-302"
  },
  {
  "course": "CSE251LAB",
  "section": "1",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "SDB",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE251LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "SDB",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE251LAB",
  "section": "3",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "M",
  "instructor": "SHK",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE251LAB",
  "section": "4",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "TDA",
  "room_no": "547 (Electronics Lab)"
  },
  {
  "course": "CSE251LAB",
  "section": "5",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "548 (Electrical Circuit Lab)"
  },
  {
  "course": "CSE301",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "MKR",
  "room_no": "107"
  },
  {
  "course": "CSE301LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "MKR",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE302",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "DMRH",
  "room_no": "108"
  },
  {
  "course": "CSE302",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "TR",
  "instructor": "KS",
  "room_no": "AB3-301"
  },
  {
  "course": "CSE302",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "AB3-801"
  },
  {
  "course": "CSE302",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "AB3-1001"
  },
  {
  "course": "CSE302LAB",
  "section": "1",
  "time_from": "10:10",
  "time_to": "1:10",
  "weekday": "T",
  "instructor": "DMRH",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE302LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "11:00",
  "weekday": "S",
  "instructor": "KS",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE302LAB",
  "section": "3",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "W",
  "instructor": "TBA",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE303",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "DMRH",
  "room_no": "110"
  },
  {
  "course": "CSE303",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "SR",
  "instructor": "DMRH",
  "room_no": "108"
  },
  {
  "course": "CSE303LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "DMRH",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE303LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "W",
  "instructor": "DMRH",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE325",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "S",
  "instructor": "TM",
  "room_no": "222"
  },
  {
  "course": "CSE325",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "TM",
  "room_no": "221"
  },
  {
  "course": "CSE325",
  "section": "2",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "TM",
  "room_no": "107"
  },
  {
  "course": "CSE325",
  "section": "3",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "MMSR",
  "room_no": "113"
  },
  {
  "course": "CSE325",
  "section": "3",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "MMSR",
  "room_no": "224"
  },
  {
  "course": "CSE325",
  "section": "4",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "MMSR",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE325",
  "section": "5",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "S",
  "instructor": "MMSR",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE325",
  "section": "5",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "R",
  "instructor": "MMSR",
  "room_no": "107"
  },
  {
  "course": "CSE325",
  "section": "6",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "MYR",
  "room_no": "AB2-203"
  },
  {
  "course": "CSE325LAB",
  "section": "1",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "W",
  "instructor": "TM",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE325LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "11:00",
  "weekday": "R",
  "instructor": "TM",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE325LAB",
  "section": "3",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "MMSR",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE325LAB",
  "section": "4",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "MMSR",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE325LAB",
  "section": "5",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "T",
  "instructor": "MMSR",
  "room_no": "530 (C. Lab-2)"
  },
  {
  "course": "CSE325LAB",
  "section": "6",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "M",
  "instructor": "MYR",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE345",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "ALI",
  "room_no": "102"
  },
  {
  "course": "CSE345",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "MKN",
  "room_no": "115"
  },
  {
  "course": "CSE345",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "S",
  "instructor": "MKN",
  "room_no": "107"
  },
  {
  "course": "CSE345",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "T",
  "instructor": "MKN",
  "room_no": "111"
  },
  {
  "course": "CSE345",
  "section": "4",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "MW",
  "instructor": "TDA",
  "room_no": "AB2-203"
  },
  {
  "course": "CSE345",
  "section": "5",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "TR",
  "instructor": "TDA",
  "room_no": "AB2-203"
  },
  {
  "course": "CSE345LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "S",
  "instructor": "ALI",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE345LAB",
  "section": "2",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "R",
  "instructor": "MKN",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE345LAB",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "R",
  "instructor": "MKN",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE345LAB",
  "section": "4",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "S",
  "instructor": "TDA",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE345LAB",
  "section": "5",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "W",
  "instructor": "TDA",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE347",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "MMSU",
  "room_no": "AB1-301"
  },
  {
  "course": "CSE347",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "SR",
  "instructor": "MMSU",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE347",
  "section": "3",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "TBA",
  "room_no": "AB3-902"
  },
  {
  "course": "CSE347LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "MMSU",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE347LAB",
  "section": "2",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "T",
  "instructor": "MMSU",
  "room_no": "533 (C. Lab-3)"
  },
  {
  "course": "CSE347LAB",
  "section": "3",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "M",
  "instructor": "TBA",
  "room_no": "534 (C. Lab-4)"
  },
  {
  "course": "CSE350",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "TBA",
  "room_no": "AB3-801"
  },
  {
  "course": "CSE350",
  "section": "2",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "TBA",
  "room_no": "AB3-401"
  },
  {
  "course": "CSE360",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "DAWR",
  "room_no": "335"
  },
  {
  "course": "CSE360",
  "section": "2",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "SR",
  "instructor": "DAWR",
  "room_no": "336"
  },
  {
  "course": "CSE360",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "ST",
  "instructor": "NYA",
  "room_no": "335"
  },
  {
  "course": "CSE360",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "SDB",
  "room_no": "AB1-701"
  },
  {
  "course": "CSE365",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "ST",
  "instructor": "AKD",
  "room_no": "AB1-401"
  },
  {
  "course": "CSE365",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "JAO",
  "room_no": "AB3-401"
  },
  {
  "course": "CSE365",
  "section": "3",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "226"
  },
  {
  "course": "CSE365",
  "section": "3",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "221"
  },
  {
  "course": "CSE365LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "R",
  "instructor": "AKD",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE365LAB",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "R",
  "instructor": "JAO",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE365LAB",
  "section": "3",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE366",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "S",
  "instructor": "AKD",
  "room_no": "223"
  },
  {
  "course": "CSE366",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "R",
  "instructor": "AKD",
  "room_no": "222"
  },
  {
  "course": "CSE366",
  "section": "2",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "219"
  },
  {
  "course": "CSE366",
  "section": "2",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "339"
  },
  {
  "course": "CSE366LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "W",
  "instructor": "AKD",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE366LAB",
  "section": "2",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "TBA",
  "instructor": "TBA",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE375",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "DSHR",
  "room_no": "435"
  },
  {
  "course": "CSE375",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "DSHR",
  "room_no": "435"
  },
  {
  "course": "CSE375",
  "section": "3",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "TR",
  "instructor": "DSHR",
  "room_no": "436"
  },
  {
  "course": "CSE405",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "MW",
  "instructor": "MAR",
  "room_no": "108"
  },
  {
  "course": "CSE405",
  "section": "2",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "TR",
  "instructor": "MAR",
  "room_no": "108"
  },
  {
  "course": "CSE405",
  "section": "3",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "MAR",
  "room_no": "102"
  },
  {
  "course": "CSE405",
  "section": "4",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "MW",
  "instructor": "MI",
  "room_no": "110"
  },
  {
  "course": "CSE405LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "S",
  "instructor": "MAR",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE405LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "MAR",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE405LAB",
  "section": "3",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "W",
  "instructor": "MAR",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE405LAB",
  "section": "4",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "T",
  "instructor": "MI",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE411",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "DSU",
  "room_no": "109"
  },
  {
  "course": "CSE411",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "T",
  "instructor": "DSU",
  "room_no": "359"
  },
  {
  "course": "CSE411",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "R",
  "instructor": "DSU",
  "room_no": "221"
  },
  {
  "course": "CSE411",
  "section": "3",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "MW",
  "instructor": "TBA",
  "room_no": "AB3-802"
  },
  {
  "course": "CSE411LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "T",
  "instructor": "DSU",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE411LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "R",
  "instructor": "DSU",
  "room_no": "637 (Database Lab)"
  },
  {
  "course": "CSE411LAB",
  "section": "3",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE412",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "MMSU",
  "room_no": "AB1-501"
  },
  {
  "course": "CSE412LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "S",
  "instructor": "MMSU",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE420",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "KS",
  "room_no": "AB1-702"
  },
  {
  "course": "CSE420",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "SR",
  "instructor": "KS",
  "room_no": "AB3-502"
  },
  {
  "course": "CSE435",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "DSHR",
  "room_no": "436"
  },
  {
  "course": "CSE435",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "DSHR",
  "room_no": "432"
  },
  {
  "course": "CSE442",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "ST",
  "instructor": "NYA",
  "room_no": "212"
  },
  {
  "course": "CSE442",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "NYA",
  "room_no": "217"
  },
  {
  "course": "CSE442",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "T",
  "instructor": "ALI",
  "room_no": "222"
  },
  {
  "course": "CSE442",
  "section": "3",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "ALI",
  "room_no": "102"
  },
  {
  "course": "CSE442",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "ALI",
  "room_no": "107"
  },
  {
  "course": "CSE442LAB",
  "section": "1",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "NYA",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE442LAB",
  "section": "2",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "R",
  "instructor": "NYA",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE442LAB",
  "section": "3",
  "time_from": "10:10",
  "time_to": "12:10",
  "weekday": "S",
  "instructor": "ALI",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE442LAB",
  "section": "4",
  "time_from": "8:00",
  "time_to": "10:00",
  "weekday": "W",
  "instructor": "ALI",
  "room_no": "634 (Digital System Lab)"
  },
  {
  "course": "CSE453",
  "section": "1",
  "time_from": "11:50",
  "time_to": "1:20",
  "weekday": "ST",
  "instructor": "MAR",
  "room_no": "432"
  },
  {
  "course": "CSE475",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "DMGR",
  "room_no": "212"
  },
  {
  "course": "CSE475",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "MMDR",
  "room_no": "337"
  },
  {
  "course": "CSE475",
  "section": "3",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "SR",
  "instructor": "TBA",
  "room_no": "AB3-802"
  },
  {
  "course": "CSE475LAB",
  "section": "3",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "R",
  "instructor": "TBA",
  "room_no": "533 (C. Lab-3)"
  },
  {
  "course": "CSE477",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "ST",
  "instructor": "JAO",
  "room_no": "AB1-401"
  },
  {
  "course": "CSE477",
  "section": "2",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "ST",
  "instructor": "JAO",
  "room_no": "AB1-402"
  },
  {
  "course": "CSE480",
  "section": "1",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "MW",
  "instructor": "ABST",
  "room_no": "217"
  },
  {
  "course": "CSE480",
  "section": "2",
  "time_from": "1:30",
  "time_to": "3:00",
  "weekday": "MW",
  "instructor": "MDH",
  "room_no": "AB3-301"
  },
  {
  "course": "CSE480LAB",
  "section": "1",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "W",
  "instructor": "ABST",
  "room_no": "529 (C. Lab-1)"
  },
  {
  "course": "CSE480LAB",
  "section": "2",
  "time_from": "4:50",
  "time_to": "6:50",
  "weekday": "R",
  "instructor": "MDH",
  "room_no": "630 (Software Engineering Lab)"
  },
  {
  "course": "CSE489",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "S",
  "instructor": "MKR",
  "room_no": "AB1-201"
  },
  {
  "course": "CSE489",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "R",
  "instructor": "MKR",
  "room_no": "217"
  },
  {
  "course": "CSE489LAB",
  "section": "1",
  "time_from": "1:30",
  "time_to": "3:30",
  "weekday": "T",
  "instructor": "MKR",
  "room_no": "638 (Artificial Intelligence Lab)"
  },
  {
  "course": "CSE497",
  "section": "1",
  "time_from": "10:00",
  "time_to": "10:02",
  "weekday": "F",
  "instructor": "TBA",
  "room_no": "Project"
  },
  {
  "course": "CSE498",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "431"
  },
  {
  "course": "CSE498",
  "section": "1",
  "time_from": "8:30",
  "time_to": "10:00",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "227"
  },
  {
  "course": "CSE498",
  "section": "2",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "MW",
  "instructor": "RDA",
  "room_no": "AB1-601"
  },
  {
  "course": "CSE498",
  "section": "3",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "T",
  "instructor": "RDA",
  "room_no": "112"
  },
  {
  "course": "CSE498",
  "section": "3",
  "time_from": "3:10",
  "time_to": "4:40",
  "weekday": "R",
  "instructor": "RDA",
  "room_no": "224"
  },
  {
  "course": "CSE498",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "T",
  "instructor": "TBA",
  "room_no": "AB3-701"
  },
  {
  "course": "CSE498",
  "section": "4",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "AB3-901"
  },
  {
  "course": "CSE499",
  "section": "1",
  "time_from": "9:00",
  "time_to": "12:00",
  "weekday": "F",
  "instructor": "TBA",
  "room_no": "Thesis"
  },
  {
  "course": "CSE597",
  "section": "1",
  "time_from": "10:10",
  "time_to": "11:40",
  "weekday": "A",
  "instructor": "TBA",
  "room_no": "Thesis"
  },
  {
  "course": "CSE599",
  "section": "1",
  "time_from": "3:00",
  "time_to": "5:00",
  "weekday": "S",
  "instructor": "TBA",
  "room_no": "Thesis"
  }
  ]
  }
  """;
  var data = await json.decode(str);

  var courses = DataLoaderService().makeCoursesFromJsonData( data, "summer_2021" );
  var response = new List<Course>.empty(growable: true);
  courses.forEach((course) {
    var code = course.code.toLowerCase();
    for(int i=0;i<courseNames.length;i++){
      if(code.contains(courseNames[i].toLowerCase())){
        response.add(course);
        break;
      }
    }
  });
  return response;
}

