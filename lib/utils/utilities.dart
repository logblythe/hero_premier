String getFormattedTimeFromUtc(String utcString) {
  DateTime dateTime = DateTime.parse(utcString);
  print('the date time is ${dateTime.toString()}');
  // DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss").parseUTC(utcString);
  int weekday = dateTime.weekday;
  int day = dateTime.day;
  int month = dateTime.month;
  int hours = dateTime.hour;
  int minutes = dateTime.minute;

  return "${getWeekday(weekday)} ${getMonthName(month)} $day, $hours:$minutes";
}

String getWeekday(int day) {
  String weekday = "SAT";
  switch (day) {
    case 1:
      weekday = "MON";
      break;
    case 2:
      weekday = "TUES";
      break;
    case 3:
      weekday = "WED";
      break;
    case 4:
      weekday = "THURS";
      break;
    case 5:
      weekday = "FRI";
      break;
    case 6:
      weekday = "SAT";
      break;
    case 7:
      weekday = "SUN";
      break;
  }
  return weekday;
}

String getMonthName(int monthNum) {
  String monthName = "JAN";
  switch (monthNum) {
    case 1:
      monthName = "JAN";
      break;
    case 2:
      monthName = "FEB";
      break;
    case 3:
      monthName = "MAR";
      break;
    case 4:
      monthName = "APR";
      break;
    case 5:
      monthName = "MAY";
      break;
    case 6:
      monthName = "JUNE";
      break;
    case 7:
      monthName = "JULY";
      break;
    case 8:
      monthName = "AUG";
      break;
    case 9:
      monthName = "SEPT";
      break;
    case 10:
      monthName = "OCT";
      break;
    case 11:
      monthName = "NOV";
      break;
    case 12:
      monthName = "DEC";
      break;
  }
  return monthName;
}