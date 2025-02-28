class Formatter {

  static String formatarData(DateTime date) {
    String day = date.day > 9 ? date.day.toString() : '0${date.day}';
    String month = date.month > 9 ? date.month.toString() : '0${date.month}';
    return '$day/$month/${date.year}';
  }
}
