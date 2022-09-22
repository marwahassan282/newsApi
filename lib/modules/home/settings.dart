
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomsheetlanguage.dart';
import 'myprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class settingTabs extends StatefulWidget {
  static const String routName='seeting';


  @override
  State<settingTabs> createState() => _settingTabsState();
}

class _settingTabsState extends State<settingTabs> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProviderApp>(context);
    return Scaffold(
      body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 30),
              InkWell(
                onTap: (){
                  showbottomsheetlanguage();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(provider.language=='en'?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,style:Theme.of(context).textTheme.subtitle1),
                ),
              ),



            ],
          ),
        ),

    );
  }

  showbottomsheetlanguage(){
    showModalBottomSheet(context: context, builder:(context){
      return bottomSheetLanguage ();
    });
  }

}
