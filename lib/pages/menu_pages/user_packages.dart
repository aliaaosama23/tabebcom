//import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/utils/theme.dart';

class UserPckages extends StatelessWidget {
  final String title;

  UserPckages({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(getTranslated(context,title)),
          iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
          textTheme:
              TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
        ),
        body:Text('pp'));
  }
}