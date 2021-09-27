import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String convertToMMDDYYYY() {
    return DateFormat('MMM dd,yyyy').format(this);
  }

  String miliSecondToDateTime() {
    var format = DateFormat('MMMM, dd yyyy HH:mm');
    var dateString = format.format(this);
    return dateString;
  }

  String timeAgo() {
    return timeago.format(this);
  }

  String daysLeft() {
    final duration = difference(DateTime.now());
    return '${duration.inDays}';
  }

  String valitTill() {
    var format = DateFormat('dd MMM, yyyy');
    var formattedDate = format.format(this);
    return formattedDate;
  }

  String dobParse() {
    var date = DateFormat('yyyy-MM-dd').format(this);
    return date;
  }
}
