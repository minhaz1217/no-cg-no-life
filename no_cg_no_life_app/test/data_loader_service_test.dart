

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/services/data_loader_service.dart';

main(){
  group("Testing basic helper functions.",(){
    test("test almost every possible start and end time to check if am and pm is working properly", (){
      // arrange
      DataLoaderService dataLoaderService = new DataLoaderService();
      // act
      // assert
      // there are only a set number of course start and end time, so we'll test all of those time here.
      expect( dataLoaderService.convertAdvisingTimeToAMPM("8:00"), DateTime.tryParse("1970-01-01 08:00:00.000"), reason: "8 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("8:30"), DateTime.tryParse("1970-01-01 08:30:00.000"), reason: "8.30 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("10:00"), DateTime.tryParse("1970-01-01 10:00:00.000"), reason: "8.30 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("10:10"), DateTime.tryParse("1970-01-01 10:10:00.000"), reason: "10.10 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("11:40"), DateTime.tryParse("1970-01-01 11:40:00.000"), reason: "11.40 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("11:50"), DateTime.tryParse("1970-01-01 11:50:00.000"), reason: "11.50 should be am" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("12:10"), DateTime.tryParse("1970-01-01 12:10:00.000"), reason: "12.10 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("1:10"), DateTime.tryParse("1970-01-01 13:10:00.000"), reason: "1.10 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("1:20"), DateTime.tryParse("1970-01-01 13:20:00.000"), reason: "1.20 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("1:30"), DateTime.tryParse("1970-01-01 13:30:00.000"), reason: "1.30 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("3:00"), DateTime.tryParse("1970-01-01 15:00:00.000"), reason: "3.30 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("3:10"), DateTime.tryParse("1970-01-01 15:10:00.000"), reason: "3.10 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("3:30"), DateTime.tryParse("1970-01-01 15:30:00.000"), reason: "3.30 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("4:40"), DateTime.tryParse("1970-01-01 16:40:00.000"), reason: "4.40 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("4:50"), DateTime.tryParse("1970-01-01 16:50:00.000"), reason: "4.50 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("6:50"), DateTime.tryParse("1970-01-01 18:50:00.000"), reason: "6.50 should be pm" );
      expect( dataLoaderService.convertAdvisingTimeToAMPM("7:50"), DateTime.tryParse("1970-01-01 19:50:00.000"), reason: "7.50 should be pm" );
    });

    test("Testing course day", (){
      // arrange
      DataLoaderService dataLoaderService = new DataLoaderService();
      // act
      CourseDay courseDay1 = dataLoaderService.getWeekDay("s", "8:00", "12:50");
      CourseDay courseDay2 = dataLoaderService.getWeekDay("A", "4:40", "7:50");
      // assert
      expect( courseDay1.weekDay, DayOfTheWeek.Sunday, reason: "s means sunday");
      expect( courseDay1.startTime, DateTime.tryParse("1970-01-01 08:00:00.000"), reason: "8 is am");
      expect( courseDay1.endTime, DateTime.tryParse("1970-01-01 12:50:00.000"), reason: "12.50 is pm");

      expect( courseDay2.weekDay, DayOfTheWeek.Saturday, reason: "a means saturday");
      expect( courseDay2.startTime, DateTime.tryParse("1970-01-01 16:40:00.000"), reason: "4.40 is pm");
      expect( courseDay2.endTime, DateTime.tryParse("1970-01-01 19:50:00.000"), reason: "7.50 is pm");
    });

    test("testName", (){
      // arrange

      // act

      // assert

    });

  });
}