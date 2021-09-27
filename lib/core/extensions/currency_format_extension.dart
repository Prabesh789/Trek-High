import 'package:easy_localization/easy_localization.dart';

extension CurrencyFormatExtension on String {
  String formatCurrency() {
    var formatter = NumberFormat('##,##,###', 'en_US');
    final value = replaceAll(',', '');
    return formatter.format(double.parse(value));
  }
}
