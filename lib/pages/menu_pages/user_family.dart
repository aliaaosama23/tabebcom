import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import '../../utils/theme.dart';

class UserFamilyPage extends StatelessWidget {
  final String title;
  UserFamilyPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, title)),
        iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
        textTheme: TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
      ),
      body: Center(child: Text('my family')),
    );
  }
}
