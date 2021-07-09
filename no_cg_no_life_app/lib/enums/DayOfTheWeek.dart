enum DayOfTheWeek{
  NULLDAY, // just to pad the DayOfTheWeek and make it compatible with DateTime.dayOfWeek() numbers.
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

String DayOfTheWeekToString(DayOfTheWeek dayOfTheWeek){
  switch(dayOfTheWeek){
    case DayOfTheWeek.Monday:
      return "Monday";
    case DayOfTheWeek.Tuesday:
      return "Tuesday";
    case DayOfTheWeek.Wednesday:
      return "Wednesday";
    case DayOfTheWeek.Thursday:
      return "Thursday";
    case DayOfTheWeek.Friday:
      return "Friday";
    case DayOfTheWeek.Saturday:
      return "Saturday";
    case DayOfTheWeek.Sunday:
      return "Sunday";
    default:
      return "";
  }
}

DayOfTheWeek StringToDayOfTheWeek(String day){
  day = day.toLowerCase();
  switch(day){
    case "monday":
      return DayOfTheWeek.Monday;
    case "tuesday":
      return DayOfTheWeek.Tuesday;
    case "wednesday":
      return DayOfTheWeek.Wednesday;
    case "thursday":
      return DayOfTheWeek.Thursday;
    case "friday":
      return DayOfTheWeek.Friday;
    case "saturday":
      return DayOfTheWeek.Saturday;
    case "sunday":
      return DayOfTheWeek.Sunday;
    default:
      return DayOfTheWeek.NULLDAY;
  }

}
