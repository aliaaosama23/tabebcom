import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;
  AppLocale(this.locale);

  Map<String, String> _loadedLocalizedValues;

// قمت بتحميل ملف الجيسون الخاص ابللغه اللوكال
  Future load() async {
    String _loadFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> _loadedValues = json.decode(_loadFile);

    _loadedLocalizedValues =
        _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  String getTranslatedValue(String key){
    return _loadedLocalizedValues[key];
  }
  
  static const LocalizationsDelegate<AppLocale> delegate=_AppLocaleDelegate();
}


class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale>{
 
  const _AppLocaleDelegate();

  @override
    bool isSupported(Locale locale) {
      return ['ar','en'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocale> load(Locale locale) async{
    AppLocale appLocale= AppLocale(locale);
    await appLocale.load();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocaleDelegate old) =>false;
    

}
