import 'package:flutter/material.dart';

class Formatter {

  static String formatarData(DateTime date) {
    String day = date.day > 9 ? date.day.toString() : '0${date.day}';
    String month = date.month > 9 ? date.month.toString() : '0${date.month}';
    return '$day/$month/${date.year}';
  }

  static String formatarHora(TimeOfDay horario) {
    String hour = horario.hour > 9 ? horario.hour.toString() : '0${horario.hour}';
    String minute = horario.minute > 9 ? horario.minute.toString() : '0${horario.minute}';
    return '$hour:$minute';
  }

  static String toJsonFormat(DateTime date) {
    String day = date.day > 9 ? date.day.toString() : '0${date.day}';
    String month = date.month > 9 ? date.month.toString() : '0${date.month}';
    String hour = date.hour > 9 ? date.hour.toString() : '0${date.hour}';
    String minute = date.minute > 9 ? date.minute.toString() : '0${date.minute}';
    return '${date.year}-$month-$day' 'T$hour:$minute:00Z';
  }
}
