import 'package:flutter/material.dart';

class CustomClr {
  static Color kblue = Colors.blue;
  static Color deepPurple = Colors.deepPurple;
  static Color kwhite = Colors.white;
  static Color kblack = Colors.black;
  static Color kred = Colors.redAccent;
}

class CustomSize {
  static var commonRadius = BorderRadius.circular(15);
}

class CustomFuction {
  static texttStyle({required weight, required color, required double size}) {
    return TextStyle(fontSize: size, fontWeight: weight, color: color);
  }
}

class CustomHeight {
  static var commonHeight = const SizedBox(height: 20);
  static var height10 = const SizedBox(height: 10);
}
