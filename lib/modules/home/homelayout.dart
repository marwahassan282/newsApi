import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/catagories-fragament.dart';
import 'package:newsapi/modules/home/homedrawar.dart';
import 'package:newsapi/modules/home/news-fragament.dart';
import 'package:newsapi/modules/home/searchpage.dart';
import 'package:newsapi/modules/home/tabs-controller.dart';

import 'package:newsapi/shared/network/remote/Api-manager.dart';

import '../../models/catagory-model.dart';
import '../../models/sourseResponse.dart';

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
            Text('news App'),


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

    }

  }

  void catagoryclicked(Catagory catagory){
    isselectedCatagory=catagory;
    setState(() {
      
    });
  }
}
