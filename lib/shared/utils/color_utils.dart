import 'package:flutter/material.dart';

Color stringToColor(String colorString) {
  String valueString =
      colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
  int value = int.parse(valueString, radix: 16);
  return Color(value);
}
