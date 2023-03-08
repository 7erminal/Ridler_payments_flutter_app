import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class HelperFunctions {
  // format draw date
  static String formatDrawDate(String date) {
    debugPrint("Date coming in is ");
    debugPrint(date);
    List<String> months = [
      'Jan.',
      'Feb.',
      'Mar.',
      'Apr.',
      'May',
      'Jun.',
      'Jul.',
      'Aug.',
      'Sept.',
      'Oct.',
      'Nov.',
      'Dec.',
    ];

    /// format of the date return from api [[2022-08-16T00:00:00]]
    // split the date into parts separated by a -
    List<String> dateParts = date.split('-');
    // // the first part is the year, the second part is the month, the third part is the day
    String year = dateParts[0];
    String month = months[int.parse(dateParts[1]) - 1];
    String day = dateParts[2].substring(0, 2);
    // construct the date
    String drawDate = '$month $day $year';

    debugPrint("Draw close date is ");
    debugPrint(drawDate);

    return drawDate;
  }
}