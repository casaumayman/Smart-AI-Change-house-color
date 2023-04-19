import 'package:flutter/material.dart';

class TimeMeasure {
  TimeMeasure(String? title) {
    debugPrint("Start measure: $title");
    _timeValue = DateTime.now();
  }
  late DateTime _timeValue;

  void nextMeasure(String title) {
    var now = DateTime.now();
    var diff = now.difference(_timeValue).inMilliseconds;
    double n = double.parse((diff / 1000).toStringAsFixed(2));
    debugPrint("$title take: $n seconds");
    _timeValue = now;
  }
}
