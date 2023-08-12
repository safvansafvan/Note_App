import 'package:flutter/material.dart';

class CustomClr {
  static Color kblue = Colors.blue;
  static Color deepPurple = Colors.deepPurple;
  static Color kwhite = Colors.white;
  static Color kblack = Colors.black;
}

class CustomSize {
  static var commonRadius = BorderRadius.circular(15);
}

class CustomFuction {
  static texttStyle({required weight, required color, required double size}) {
    return TextStyle(fontSize: size, fontWeight: weight, color: color);
  }
}
