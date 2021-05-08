import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';

class AboutPage extends StatelessWidget {
  final String title;
  AboutPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, title)),
      ),
      body: Container(
        child: Center(
          child: Text('my about'),
        ),
      ),
    );
  }
}
