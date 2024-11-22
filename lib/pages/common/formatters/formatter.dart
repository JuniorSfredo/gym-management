class Formatter {

  static String formatarData(DateTime date) {
    String day = date.day > 9 ? date.day.toString() : '0${date.day}';
    return '$day/${date.month}/${date.year}';
  }
}
