import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';


String getTranslated(BuildContext context, String key) {
  return AppLocale.of(context).getTranslatedValue ( key);
}

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ARABIC = 'ar';

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case ARABIC:
      return Locale(ARABIC, "SA"); 
    default:
      return Locale(ARABIC, "SA"); 
  }
}

// usig SharedPreferences set and get

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "ARABIC";
  return _locale(languageCode);
}


