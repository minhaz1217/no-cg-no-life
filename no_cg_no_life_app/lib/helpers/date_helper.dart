import 'package:intl/intl.dart';

String convertDateTimeToAMPMTime(DateTime dateTime){
  return DateFormat('hh:mm a').format(dateTime);
}