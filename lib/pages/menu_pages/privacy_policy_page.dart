import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final String title;
  PrivacyPolicyPage({this.title});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        TextStyle(fontSize: 18.0, fontFamily: 'DinNextRegular');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(getTranslated(context, title)),
      ),
      body: Padding(
          child: ListView(
            children: [
              Text(
                getTranslated(context, "privacyfirst").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacyone").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacytwo").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacythree").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacyfour").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacyfive").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "privacysex").toString(),
                style: textStyle,
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0)),
    );
  }
}
