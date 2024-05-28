class Date {

  static  getDate(date) {
    DateTime dateTime = DateTime.parse(date);
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    return '$day-$month-$year';
  }
}
class Datee {

  static  getDate(date) {
    DateTime dateTime = DateTime.parse(date);
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    return '$year-$month-$day';
  }
}
