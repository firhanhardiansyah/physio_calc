// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class DateTimeHelper {
  static dynamic changeTimeZone(dynamic value) {
    if (value == false || value == null) return null;

    DateTime date = DateTime.parse("$value");
    date = date.add(DateTime.parse("$value").timeZoneOffset);
    return date.toString();
  }

  static dynamic changeTimeZoneDifferentFormats(dynamic dateTime, [String format = 'MM/dd/yyyy, HH:mm:ss']) {
    if (dateTime == false || dateTime == null) return null;

    DateFormat dateFormat = DateFormat(format);
    DateTime dateDate = dateFormat.parse(dateTime);
    DateTime dateTimeZone = dateDate.add(dateDate.timeZoneOffset);
  
    return dateTimeZone.toString();
  }

  static String changeDateTime({required dynamic dateTime, String? format}) {
    if (dateTime == null) return '';
    if (dateTime.runtimeType == String) {
      dateTime = DateTime.parse('$dateTime');
    }
    format = format ?? 'yyyy-MM-dd';
    String formated = DateFormat(format, "id_ID").format(dateTime);
    return formated = formated.toString();
  }

  static String changeDateTimeWithDayName(
      {required DateTime dateTime, bool? withTime = false}) {
    String format =
        withTime == true ? 'EEEE, dd MMMM yyyy HH:mm' : 'EEEE, dd MMMM yyyy';

    String formated = changeDateTime(dateTime: dateTime, format: format);
    return formated;
  }

  static String changeDateTimeToTime(
      {required DateTime dateTime, bool? withTime = false}) {
    String formated = changeDateTime(dateTime: dateTime, format: 'HH:mm');
    return formated;
  }

  static String changeDateTimeNowToUtc({required dynamic dateTime}) {
    if (dateTime == null) return '';
    String formated =
        DateFormat("yyyy-MM-dd HH:mm:ss", "id_ID").format(dateTime.toUtc());
    return formated.toString();
  }

  static String changeDateToUtc({required dynamic dateTime, String? format}) {
    if (dateTime == null) return '';
    if (dateTime.runtimeType == String) {
      dateTime = DateTime.parse('$dateTime');
    }
    final changeFormat = format ?? "yyyy-MM-dd";

    String formated =
        DateFormat(changeFormat, "id_ID").format(dateTime.toUtc());

    return formated.toString();
  }

  static String formattedDateTime(dynamic value, String format) {
    if (value == null || value == false) return '...';
    if (value.runtimeType == String) {
      value = DateTime.parse('$value');
    }
    String formattedToString = DateFormat(format, 'id_ID').format(value);
    return formattedToString;
  }
}