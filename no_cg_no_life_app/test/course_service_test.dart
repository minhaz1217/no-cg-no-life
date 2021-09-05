import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:no_cg_no_life_app/enums/CourseType.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/services/course_service.dart';
import 'package:no_cg_no_life_app/services/data_loader_service.dart';
import 'package:test/test.dart';

import 'test_data_seeder.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
void main() {
  group("Testing Course conflict helper functions",()
  {
    var courseNames = [ "CSE101", "CSE103", "CSE108", "CSE106"];
    test("Data seeder loading properly",
      () async {
        var data = await getCoursesForConflictTest(courseNames);
        expect(data.length > 0, true);
      }
    );


    test("Course day conflict detection.", (){
      // arrange
      DataLoaderService dataLoaderService = new DataLoaderService();
      CourseService courseService = new CourseService();
      CourseDay sundayCourse1 = dataLoaderService.getWeekDay("s", "10:10", "11:40");
      CourseDay sundayStartTimeSame = dataLoaderService.getWeekDay("s", "10:10", "3:40");
      CourseDay sundayEndTimeSame = dataLoaderService.getWeekDay("s", "8:10", "11:40");
      CourseDay sundayStartEndTimeFallsInside = dataLoaderService.getWeekDay("s", "10:20", "10:30");
      CourseDay sundayStartTimeEndTimeMatchesExactly = dataLoaderService.getWeekDay("s", "10:10", "11:40");
      CourseDay sundayStartTimeIsAnothersEndTime = dataLoaderService.getWeekDay("s", "11:40", "1:30");
      CourseDay sundayStartTimeEndTimeDifferent = dataLoaderService.getWeekDay("s", "11:50", "1:30");
      CourseDay saturdayCourse = dataLoaderService.getWeekDay("A", "10:10", "11:40");
      // act

      // assert
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  saturdayCourse), false, reason: "Courses of different days shouldn't conflict with each other.");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayStartTimeEndTimeDifferent), false, reason: "Should not conflict if time doesn't match");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayStartTimeSame), true, reason: "Should conflict even if start time is exactly same");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayEndTimeSame), true, reason: "Should conflict even if end time is exactly same");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayStartEndTimeFallsInside), true, reason: "Should conflict even if both time is inside");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayStartTimeEndTimeMatchesExactly), true, reason: "Should conflict if both start and end time matches exactly");
      expect(courseService.detectConflictBetween2Days(sundayCourse1,  sundayStartTimeIsAnothersEndTime), true, reason: "Should conflict if one's end time is another's starttime.");
    });

    test("Testing time conflict between 2 courses", (){
      // arrange

      DataLoaderService dataLoaderService = new DataLoaderService();
      CourseService courseService = new CourseService();

      CourseDay courseDay1 = dataLoaderService.getWeekDay("s", "10:10", "11:40");
      Course courseSunDayTuesDay = new Course(courseCode: "101", weekDay1: courseDay1.weekDay, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course courseMondayWednesDay = new Course(courseCode: "101", weekDay1: DayOfTheWeek.Monday, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, weekDay2: DayOfTheWeek.Wednesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);

      CourseDay courseDay2 = dataLoaderService.getWeekDay("s", "11:50", "1:30");
      Course courseSunDayTuesDayDifferentTime = new Course(courseCode: "101", weekDay1: courseDay2.weekDay, day1StartTime: courseDay2.startTime, day1EndTime: courseDay2.endTime, weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay2.startTime, day2EndTime: courseDay2.endTime);
      Course courseSunDayTuesDaySameTime = new Course(courseCode: "101", weekDay1: courseDay1.weekDay, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course courseDay1SameTimeSame = new Course(courseCode: "101", weekDay1: courseDay1.weekDay, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, weekDay2: DayOfTheWeek.Wednesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course courseDay2SameTimeSame = new Course(courseCode: "101", weekDay1: DayOfTheWeek.Monday, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);

      Course labCourse = new Course(courseCode: "101", weekDay1: courseDay1.weekDay , day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, courseType: CourseType.LabCourse,weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course labCourseDay1DifferentTimeSame = new Course(courseCode: "101", weekDay1: DayOfTheWeek.Monday, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, courseType: CourseType.LabCourse);
      Course labCourseDay1DifferentDay2AndTimeSame = new Course(courseCode: "101", weekDay1: DayOfTheWeek.Monday, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, courseType: CourseType.LabCourse,weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course labCourseDay1IsDifferentDay2IsSame = new Course(courseCode: "101", weekDay1: DayOfTheWeek.Tuesday, day1StartTime: courseDay1.startTime, day1EndTime: courseDay1.endTime, courseType: CourseType.LabCourse,weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);
      Course labCourseDay1IsSameTimeDifferentDay2IsSame = new Course(courseCode: "101", weekDay1: courseDay2.weekDay , day1StartTime: courseDay2.startTime, day1EndTime: courseDay2.endTime, courseType: CourseType.LabCourse,weekDay2: DayOfTheWeek.Tuesday, day2StartTime: courseDay1.startTime, day2EndTime: courseDay1.endTime);

      // act
      // assert
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, courseMondayWednesDay), false, reason: "Different week day even on same time shouldn't conflict");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, courseSunDayTuesDayDifferentTime), false, reason: "Shouldn't conflict if time is different even if same day.");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, courseSunDayTuesDaySameTime), true, reason: "Should conflict if time is same in same day.");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, courseDay1SameTimeSame), true, reason: "Should conflict if time is same and 1st day is same.");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, courseDay2SameTimeSame), true, reason: "Should conflict if time is same and 2nd day is same.");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, labCourseDay1DifferentTimeSame), false, reason: "Shouldn't conflict if lab course and time is same and 1st day is same.");
      expect(courseService.detectCourseTimeConflict(courseSunDayTuesDay, labCourseDay1DifferentDay2AndTimeSame), false, reason: "Shouldn't conflict if lab course and time is same and 1st day is same and 2nd day's time and day is same");
      expect(courseService.detectCourseTimeConflict(labCourseDay1IsDifferentDay2IsSame, labCourseDay1DifferentDay2AndTimeSame), false, reason: "Shouldn't conflict if 2 lab course and first day is different but 2nd days is fully same.");
      expect(courseService.detectCourseTimeConflict(labCourse, labCourseDay1IsSameTimeDifferentDay2IsSame), false, reason: "Shouldn't conflict if 2 lab course and first day is same time different but 2nd days is fully same.");

    });

    test("Test Name", (){
      // arrange

      // act

      // assert

    });
  }
  );
}