import 'package:intl/intl.dart';

String convertDateTimeToAMPMTime(DateTime dateTime){
  return DateFormat('hh:mm a').format(dateTime);
}

// removeDate resets the date to 1970-01-01, but keeps the AM PM time
DateTime removeDateKeepAMPMTime(DateTime dateTime){
  var newDate = DateFormat("hh:mm a").parse(DateFormat('hh:mm a').format(dateTime).toString());
  return newDate;
}