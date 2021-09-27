extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

// String parseHtml() {
//   final value = this..replaceAll('<p>', '')..replaceAll('</p>', '');
//   return value;
// }
