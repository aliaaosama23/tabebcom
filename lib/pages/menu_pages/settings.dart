import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/models/languages.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  SettingsPage({this.title});
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    print('new lag is '+ language.countryCode);
    Locale _locale = await setLocale(language.countryCode);
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,widget.title)),
      ),
      body: Container(
      
        child:
             Center(
               child: DropdownButton<Language>(
                 hint:Text('Change Language'),
                  onChanged: (Language language) {
                    _changeLanguage(language);
                    print('selected lang is ${language.countryCode}');
                  },
                 
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                          value: lang,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text(lang.name), Text(lang.flag)],
                          )))
                      .toList(),
                ),
             )
         
      ),
    );
  }
}
