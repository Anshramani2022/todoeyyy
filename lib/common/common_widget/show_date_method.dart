var MONTHS = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

String formattedDateTime() {
  DateTime now = DateTime.now();
  return now.day.toString() +
      " " +
      MONTHS[now.month - 1] +
      " " +
      now.year.toString() +
      " " +
      now.hour.toString() +
      ":" +
      now.minute.toString() +
      ":" +
      now.second.toString();
}
