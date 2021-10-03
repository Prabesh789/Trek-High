import 'package:easy_localization/easy_localization.dart';

extension CurrencyFormatExtension on String {
  String formatCurrency() {
    final formatter = NumberFormat('##,##,###', 'en_US');
    final value = replaceAll(',', '');
    return formatter.format(double.parse(value));
  }
}
