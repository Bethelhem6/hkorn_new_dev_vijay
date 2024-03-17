import 'package:intl/intl.dart';

class FormatIOS8601Time {
  Map castToDateTime(String dateInISO) {
    DateTime x = DateTime.parse(dateInISO);
    String formatted = DateFormat('hh:mm a').format(x);
    String castedDateTime = "${x.day}-${x.month}-${x.year}";
    String castedTime = "${x.hour}:${x.minute}";
    String timeZoneName = x.timeZoneName;
    int timeInMillSecond = x.millisecondsSinceEpoch;

    List<String> monthsName = ['Jan', 'Feb', 'Mar', 'Apr', "May", "Jun", "Jul", "Aug", 'Sep', 'Oct', 'Nov', 'Dec'];

    return {
      'date': castedDateTime,
      'time': castedTime,
      'timeZone': timeZoneName,
      'timeInMillSecond': timeInMillSecond,
      'formattedTime': formatted,
      'dateTimeFormat': x,
      'month_date_time': '${x.day}-${monthsName[x.month-1]} $formatted'
    };
  }

  Future<String> casteDateTimeToISO8016(DateTime dateTime) async {
    return dateTime.toIso8601String();
  }
}
