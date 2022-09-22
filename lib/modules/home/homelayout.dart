import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/catagories-fragament.dart';
import 'package:newsapi/modules/home/homedrawar.dart';
import 'package:newsapi/modules/home/news-fragament.dart';
import 'package:newsapi/modules/home/searchpage.dart';
import 'package:newsapi/modules/home/settings.dart';
import 'package:newsapi/modules/home/tabs-controller.dart';

import 'package:newsapi/shared/network/remote/Api-manager.dart';

import '../../models/catagory-model.dart';
import '../../models/sourseResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text( AppLocalizations.of(context)!.newsTitle),
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(20),
    bottomLeft: Radius.circular(20
    )
  )
),


        


      ),
      drawer: HomeDrawer(catagoryItem),
      body:isselectedCatagory==null?CatagoriesFragment(catagoryclicked):NewsFragment(isselectedCatagory!),

    );

  }

Catagory ? isselectedCatagory;
  void catagoryItem(int item){
    Navigator.pop(context);
    if(item==HomeDrawer.cat){
      isselectedCatagory=null;
      setState(() {

      });

    }
    else if(item==HomeDrawer.seeting){
      Navigator.pushNamed(context, settingTabs.routName);

    }

  }

  void catagoryclicked(Catagory catagory){
    isselectedCatagory=catagory;
    setState(() {
      
    });
  }
}
