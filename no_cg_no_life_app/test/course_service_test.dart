import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:no_cg_no_life_app/enums/DayOfTheWeek.dart';
import 'package:no_cg_no_life_app/models/CourseDay.dart';
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


    test("Test Name", (){
      // arrange

      // act

      // assert

    });
  }
  );
}