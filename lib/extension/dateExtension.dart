import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatTo(String pattern) {
    final format = DateFormat(pattern, 'th');
    return format.format(toLocal());
  }

  String parseDDMMYYHm() {
    final date = DateFormat.yMMMd('th').format(DateTime.now());
    final time = DateFormat.Hm('th').format(DateTime.now());
    return 'วันที่ $date เวลา $time';
  }

  String formatDateto(DateTime date) {
    var buddhistCalendarYear = date.year + 543; // Convert to Buddhist calendar year
    return DateFormat('dd-MM-yyyy').format(
      DateTime(buddhistCalendarYear, date.month, date.day),
    );
  }
}
