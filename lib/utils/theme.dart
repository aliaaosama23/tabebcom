import 'package:flutter/material.dart';

ThemeData myThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF0ebcbb),
  accentColor: Color(0xFF15156b),
  buttonColor: Color(0xFF0ebcbb),
  buttonTheme: ButtonThemeData(
    disabledColor: Color(0xFFe0e0e0),
  ),
  fontFamily: 'HelveticaNeueW23-Reg',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'DinNextRegular',
    ),
    button: TextStyle(
      fontSize: 20.0,
      fontFamily: 'HelveticaNeueW23-Reg',
      color: Color(0xFF0ebcbb),
    ),
    headline6: TextStyle(fontSize: 50.0),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle(color: Color(0xFF0ebcbb),fontFamily: 'DinNextRegular',fontSize: 18.0),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF0ebcbb),
  ),
);
