import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/news-item.dart';
import 'package:newsapi/modules/home/searchpage.dart';
import 'package:newsapi/shared/network/remote/Api-manager.dart';

import '../../models/newsResponse.dart';
import '../../models/sourseResponse.dart';


class newsScreen extends StatefulWidget {

  Sources newsSource;

  static const String routName='news';
newsScreen(this.newsSource);

  @override
  State<newsScreen> createState() => _newsScreenState();
}

class _newsScreenState extends State<newsScreen> {

  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
title: Text(widget.newsSource.name!),

actions: [

  InkWell(
    onTap: (){
      Navigator.pushNamed(context, SearchPage.routName);
    },
      child: Icon(Icons.search))
],





      ),
      body:  FutureBuilder<NewsResponse>(
          future: ApiManger.getnews(widget.newsSource,SearchPage.controller.text),
          builder:(c,snapShot){
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(
                  child: CircularProgressIndicator()
              );}
            if(snapShot.hasError){
              return Column(
                children: [
                  Text('something went error'),
                  ElevatedButton(onPressed:(){}, child:Text('try Again')),
                ],
              );

            }

            if('0k'!=snapShot.data?.status){
              Column(
                children: [
                  Text('something went error'),
                  ElevatedButton(onPressed:(){}, child:Text('try Again')),
                ],
              );
            }
            var newslist=snapShot.data?.articles??[];
            return ListView.builder(itemCount: newslist.length,
                itemBuilder: (context,index){
                  return  NewsItem(newslist[index]);

                });

          })

    );
  }
}
