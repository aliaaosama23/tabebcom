import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';

class UseRulesPage extends StatelessWidget {
  final String title;
  UseRulesPage({this.title});
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
                getTranslated(context, "termsfirst").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "termslast").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms1").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms2").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms3").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms4").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms5").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms6").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms7").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms8").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms9").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms10").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms11").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms12").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms13").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms14").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms15").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms16").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms17").toString(),
                style: textStyle,
              ),
              Text(
                getTranslated(context, "terms18").toString(),
                style: textStyle,
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0)),
    );
  }
}
