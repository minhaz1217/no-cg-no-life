

import 'package:flutter_test/flutter_test.dart';
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

    test("Test Name", (){
      // arrange

      // act

      // assert

    });
  });
}