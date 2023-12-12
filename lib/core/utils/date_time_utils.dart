import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'yyyy-MM-dd hh:mm';
const String timeFormatPattern = 'hh:mm';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String stringToDate({
  required String text,
  String? locale,
  String pattern = timeFormatPattern,
}) {
  if (locale != null && locale.isNotEmpty) {
    initializeDateFormatting(locale);
  }
  return DateFormat(pattern, locale).format(DateTime.parse(text));
}

String getMonthNameFromInt(int month) {
  return DateFormat.MMMM().format(DateTime(DateTime.now().year, month));
}

String getMonthNameFromDate(String date) {
  return DateFormat.MMM().format(DateTime.parse(date));
}

String getDayNameFromDate(String date) {
  return DateFormat.E().format(DateTime.parse(date));
}

String getDayNumberFromDate(String date) {
  return DateFormat.d().format(DateTime.parse(date));
}

String getFullDate(String date) {
  return DateFormat.yMMMMd().format(DateTime.parse(date));
}

String getFullTime(String date) {
  return DateFormat.jm().format(DateTime.parse(date));
}
