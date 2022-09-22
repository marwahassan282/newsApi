import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/catagories-fragament.dart';
import 'package:newsapi/modules/home/homelayout.dart';
import 'package:newsapi/modules/home/news.dart';
import 'package:newsapi/modules/home/searchpage.dart';
import 'package:newsapi/shared/style/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/home/myprovider.dart';
import 'modules/home/settings.dart';

void main() {

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyProviderApp();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late MyProviderApp provider;

  @override
  Widget build(BuildContext context) {
    provider=Provider.of<MyProviderApp>(context);
    initsharedpreference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [

        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.language),
      routes:{
        HomeScreen.routeName:(c)=>HomeScreen(),
    settingTabs.routName:(c) =>settingTabs(),
        SearchPage.routName:(c)=>SearchPage()

      } ,
      initialRoute:HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme:MyThemeData.darkTheme,
    );

  }
  void initsharedpreference() async{
    final prefs = await SharedPreferences.getInstance();
    String lang=prefs.getString('language')??'en';
    provider.changeLanguage(lang);

  }
}

