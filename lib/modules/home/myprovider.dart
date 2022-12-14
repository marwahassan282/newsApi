import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProviderApp extends ChangeNotifier{
  String language='en';
 ThemeMode themmode=ThemeMode.light;

  void changeLanguage(String languageCode)async{
    if(languageCode==language) {
      return;
    }
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageCode);
    language=languageCode;
    notifyListeners();
  }


}