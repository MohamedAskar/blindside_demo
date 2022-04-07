import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    primarySwatch: Colors.red,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: 'Touche',
    iconTheme: IconThemeData(color: Colors.black),
    focusColor: Colors.red,
    hintColor: Colors.black54,
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          height: 1.3),
      headline4: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          height: 1.3),
      headline3: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          height: 1.3),
      headline2: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          height: 1.4),
      headline1: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          height: 1.4),
      subtitle2: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.2),
      subtitle1: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          height: 1.2),
      bodyText2: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
          height: 1.2),
      bodyText1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.2),
    ),
  );
}
