import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/homelayout.dart';
import 'package:newsapi/shared/style/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        HomeScreen.routeName:(c)=>HomeScreen(),
      } ,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme:MyThemeData.darkTheme,
    );

  }
}

