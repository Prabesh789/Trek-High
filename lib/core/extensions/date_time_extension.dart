import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String convertToMMDDYYYY() {
    return DateFormat('MMM dd,yyyy').format(this);
  }

  String miliSecondToDateTime() {
    final format = DateFormat('MMMM, dd yyyy HH:mm');
    final dateString = format.format(this);
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
    final format = DateFormat('dd MMM, yyyy');
    final formattedDate = format.format(this);
    return formattedDate;
  }

  String dobParse() {
    final date = DateFormat('yyyy-MM-dd').format(this);
    return date;
  }
}
